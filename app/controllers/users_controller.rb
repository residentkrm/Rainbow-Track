class UsersController < ApplicationController
	active_scaffold :user do |config|
      config.action_links.add 'import', { :label => 'Import Dump',
            :type => :table, :popup => false, :inline => true, :controller => 'users', :action => 'import_dump'  }
      config.action_links.add 'delete_all', { :label => 'Delete All', :confirm => 'Are you sure you want to delete all stored hashes?',
            :type => :table, :popup => false, :inline => false, :controller => 'users', :action => 'delete_all'  }

      config.columns = [:username, :hosts, :cracked, :hash_values]
		config.columns[:hash_values].label = "Hashes"

		config.actions.exclude :update
		config.actions.exclude :create
		config.actions.exclude :delete
		config.actions.exclude :show
	end

	def do_new
	end

   def delete_all
      User.find(:all).each do |h|
         User.delete(h)
      end

      redirect_to :action => 'index'
   end

   def import_dump
      render :layout => false
   end

   def upload_dump
		if params[:upload]
			if params[:selected_host]
				host = Host.find_or_create_by_address(params[:selected_host][:id])
			else
				host = nil
			end

      	User.import_dump(params[:upload], host)
		end
	
		redirect_to :action => 'index'
   end
end
