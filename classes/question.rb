class Question

	def initialize
		@pastel = Pastel.new
	end

	def ask_question(prompt)
	end

	def correct_answer(str)
		file = "music/Bing-sound.mp3"
		if File.exist?(file) && (ARGV.include?("-s"))
			pid = fork{ exec 'afplay', file } 
			sleep(1)
			Process.detach(pid)
			Process.kill('SIGHUP', pid)
					puts "tada"

		end
		puts @pastel.green(str)
	end

	def not_correct_answer(str)
		file = "music/Wrong-answer-sound-effect.mp3"
		if File.exist?(file) && (ARGV.include?("-s"))
			pid = fork{ exec 'afplay', file } 
			sleep(1)
			Process.detach(pid)
			Process.kill('SIGHUP', pid)
		end
		puts @pastel.red(str)
	end

	def prompt
	end
end