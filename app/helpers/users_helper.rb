module UsersHelper
	def hosts_column(record)
		record.hosts.size
	end

	def cracked_column(record)
		cracked = record.hash_values.reject do |h|
			if h.hash_status != HashStatus.find_by_name('Cracked')
				true
			end	
		end

		cracked.size.to_i
	end
end
