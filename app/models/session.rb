class Session < ActiveRecord::Base
	has_many :hash_values
	belongs_to :session_status

	def self.active_sessions
		s = Session.find_by_session_status_id(SessionStatus.find_by_name('Active').id)
		s ? s.size : 0	
	end
end
