class Question

	def initialize
		@pastel = Pastel.new
	end

	def ask_question(prompt)
	end

	def correct_answer(str)
		puts @pastel.green(str)
	end

	def not_correct_answer(str)
		puts @pastel.red(str)
	end

	def prompt
	end
end