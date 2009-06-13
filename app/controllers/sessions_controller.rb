class SessionsController < ApplicationController
	active_scaffold :session do |config|
		config.columns = [:start, :end, :duration, :hash_values, :session_status]
		config.columns[:session_status].label = "Status"
		config.columns[:hash_values].label = "Cracked"
		config.actions.exclude :create
		config.actions.exclude :update
		#config.actions.exclude :delete
	end
end
