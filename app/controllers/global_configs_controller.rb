class GlobalConfigsController < ApplicationController
	active_scaffold :global_configs do |config|
		config.actions.exclude :show
		config.label = "Global Configuration"
	end
end
