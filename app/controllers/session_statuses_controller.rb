class SessionStatusesController < ApplicationController
	active_scaffold :session_status do |config|
		config.actions.exclude :show
		config.label = "Session Status"
	end
end
