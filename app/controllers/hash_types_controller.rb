class HashTypesController < ApplicationController
	active_scaffold :hash_type do |config|
		config.columns = [:name, :hash_values]
		config.columns[:hash_values].label = "Hashes"
		config.actions.exclude :show
		config.create.columns = [:name]
		config.update.columns = [:name]
	end
end
