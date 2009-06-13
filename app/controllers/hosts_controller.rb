class HostsController < ApplicationController
	active_scaffold :hosts do |config|
		config.columns = [:address, :users]
		config.create.columns = [:address]
		config.update.columns = [:address]
		config.actions.exclude :show
	end
end
