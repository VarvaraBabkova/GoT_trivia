class WinnersBoard

	attr_accessor :win_list

	
	def initialize
		@name = "data/win.txt"
		@win_list = ["empty 0\n", "empty 0\n", "empty 0\n"]

		if File.exists?(@name)
			f = File.open(@name)
			@win_list = f.readlines#.map(&:chomp)
			f.close
		else
			File.open(@name, "w").close 

		end
	end

	def save_list
		#puts "save" + @win_list.inspect
		@win_list = @win_list[0..2]

		File.open(@name, "w") { |f| 
			@win_list.each do |i| 
				f.write (i) 
			end
			
		}
	end



end