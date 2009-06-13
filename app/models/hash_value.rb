class HashValue < ActiveRecord::Base
	has_and_belongs_to_many :users
	belongs_to :hash_type
	belongs_to :hash_status
	belongs_to :session

	validates_presence_of :hash_type
	validates_presence_of :hash_value

	def to_s
		hash_value
	end
end
