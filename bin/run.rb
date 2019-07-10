require_relative '../config/environment'
require 'tty-prompt'
ActiveRecord::Base.logger.level = 1
$prompt = TTY::Prompt.new
$pastel = Pastel.new



def welcome
    puts "W E L C O M E   T O"
    font = TTY::Font.new(:standard)
    puts $pastel.yellow(font.write("GOT Trivia"))
    puts $pastel.red("When you play the game of thrones, you win or you die. There is no middle ground.")

end
    
def wrong_answer
        oh_no = $prompt.yes?("Your DEAD! Would you Like to play again?")
        if oh_no == true
            welcome
        else
            puts "When you play the game of thrones, you win or you die. There is no middle ground."

            sleep(10)
            exit!
        end
   end


welcome
q1(prompt)
q2(prompt)
q3(prompt)
# q4(prompt)

    



