class HashStatusesController < ApplicationController
	active_scaffold :hash_status do |config|
		config.label = "Hash Statuses"
		config.actions.exclude :show
		config.actions.exclude :delete
		config.actions.exclude :update
		config.actions.exclude :create
	end
end
