require_relative '../config/environment'
require 'tty-prompt'
ActiveRecord::Base.logger.level = 1
prompt = TTY::Prompt.new

def welcome
    puts "W E L C O M E   T O"
    font = TTY::Font.new(:standard)
    pastel = Pastel.new
    puts pastel.yellow(font.write("GOT Trivia"))
  
end

def clear_logs
    system "clear"
end







welcome
q1(prompt)
q2(prompt)
q3(prompt)
# q4(prompt)
