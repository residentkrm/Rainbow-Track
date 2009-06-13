class User < ActiveRecord::Base
	has_and_belongs_to_many :hosts
	has_and_belongs_to_many :hash_values

	def to_s
		username
	end
		
	def self.import_dump(upload, host)
		hashes = 0

		upload['datafile'].each do |line|
			if line =~ /(.+?):.+?:([A-Fa-f0-9]{16})([A-Fa-f0-9]{16}):(.+?):::/
				u = User.find_or_create_by_username($1)

				if !host.nil?
					u.hosts << host
				end
				u.save

				h = HashValue.find_or_create_by_hash_value($2)
				h.hash_type = HashType.find_or_create_by_name('LM')
				if h.hash_status.nil?	
					h.hash_status = HashStatus.find_or_create_by_name('New')
				end
				h.users << u
				h.save

				h = HashValue.find_or_create_by_hash_value($3)
				h.hash_type = HashType.find_or_create_by_name('LM')
				if h.hash_status.nil?	
					h.hash_status = HashStatus.find_or_create_by_name('New')
				end
				h.users << u
				h.save

 				h = HashValue.find_or_create_by_hash_value($4)
				h.hash_type = HashType.find_or_create_by_name('NTLM')
				if h.hash_status.nil?	
					h.hash_status = HashStatus.find_or_create_by_name('New')
				end
				h.users << u
				h.save

				hashes += 3
			end
		end
		
		return hashes	
	end
end
