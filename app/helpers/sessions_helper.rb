module SessionsHelper
	def cracked_status(record)
		record.hash_values.size
	end

	def start_column(record)
		record.start.strftime('%Y/%m/%d %H:%M:%S')
	end

   def end_column(record)
      record.end.strftime('%Y/%m/%d %H:%M:%S')
   end

end
