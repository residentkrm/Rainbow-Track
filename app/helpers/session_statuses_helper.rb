module SessionStatusesHelper
	def sessions_column(record)
		record.sessions.size
	end
end
