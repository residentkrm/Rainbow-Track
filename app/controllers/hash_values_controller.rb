class HashValuesController < ApplicationController
	active_scaffold :hash_value do |config|
		config.columns = [:hash_value, :plaintext, :hash_type, :users]
		config.columns[:hash_value].label = "Hash"
		config.label = "Hashes"
		config.update.columns = [:hash_status, :plaintext]
		config.columns[:hash_type].form_ui = :select
		config.columns[:hash_status].form_ui = :select
		config.actions.exclude :show

    config.action_links.add 'delete_all', { :label => 'Delete All', :confirm => 'Are you sure you want to delete all stored hashes?', 
          :type => :table, :popup => false, :inline => false, :controller => 'hash_values', :action => 'delete_all'  }

	end

	def delete_all
		HashValue.find(:all).each do |h|
			HashValue.delete(h)
		end

		redirect_to :action => 'index'
	end	

	def get_new_lm
		hs = ""
		HashValue.find_all_by_hash_status_id(HashType.find_by_name('LM').id).each do |h|
			if h.hash_type == HashType.find_by_name('LM')
				hs += "#{h}\n"
			end
		end

		render :text => hs, :layout => false
	end

	def set_plaintext
		if params[:hash] && params[:plaintext]
			h = HashValue.find_or_create_by_hash_value(params[:hash])
			h.plaintext = params[:plaintext]
			h.save
		end

		render :text => '' 
	end	
		
	def submit_hash
		if params[:hash] && params['hash_type']
			h = HashValue.find_or_create_by_hash_value(params[:hash])
			h.hash_type = HashType.find_or_create_by_name(params['hash_type'])
			h.save
		end

		render :text => ''
	end

	def start_rcrack
		max = GlobalConfig.find_by_name('MAX_SESSIONS') ? GlobalConfig.find_by_name('MAX_SESSIONS').value.to_i : 1
		
		if Session.active_sessions < max
			tmp_file = "#{GlobalConfig.find_by_name('RCRACK_TMP_PATH').value}/#{rand(1000000000)}"
			s = Session.new(:start => Time.new, :session_status => SessionStatus.find_by_name('Active'))	

			f = File.new(tmp_file, "w")
     		HashValue.find_all_by_hash_status_id(HashType.find_by_name('LM').id).each do |h|
        		if h.hash_type == HashType.find_by_name('LM')
					f.write("#{h.hash_value}\n")
					h.hash_status = HashStatus.find_by_name('Cracking')
					h.save
        		end
     		end
			f.close

			rcrack = "#{GlobalConfig.find_by_name('RCRACK_PATH').value} " +
					"#{GlobalConfig.find_by_name('RCRACK_TABLE_PATH').value}/*.rt " +
					"-l #{tmp_file}"

			`#{rcrack}`.split("\n").each do |line|
				if line =~ /^(.+?), (.+?)$/
					h = HashValue.find_by_hash_value($1)
					h.hash_status = HashStatus.find_by_name('Cracked')
					h.session = s
					h.plaintext = $2
					logger.info($2)
					h.save
				end
			end

			File.delete(tmp_file)	
			s.end = Time.new
			s.duration = (format("%.2f", Time.new - s.start)).to_f
			s.session_status = SessionStatus.find_by_name('Completed')
			s.save
		
			render :text => '', :layout => false
		end
	end
end
