def draw_dragon

    box = TTY::Box.frame(
      width: TTY::Screen.width ,
      height: 20,
      align: :center,
      padding: 3,
      style: {
          fg: :bright_red,
          bg: :black,
          border: {
            fg: :bright_blue,
            bg: :black
          }
        }
    ) do
        " ___------~~~~~~~~~~~----__           .:.         __----~~~~~~~~~~~------___   
 ~~ ~--__          ......====\\\\~~    .:::.    ~~//====......          __--~ ~~ 
         ~\\ ...::::~~~~~~  //|||    .:::::.    |||\\\\  ~~~~~~::::... /~         
        -~~\\_            //  |||***.(:::::).***|||  \\\\            _/~~-        
             ~\\_        // *******.:|\\^^^/|:.******* \\\\        _/~             
                \\      / ********.::(>: :<)::.******** \\      /                
                 \\   /  ********.::::\\\\|//::::.********  \\   /                 
                  \\ /   *******.:::::(o o):::::.*******   \\ /                  
                   /.   ******.::::'*|V_V|***`::.******   .\\                   
                     ~~--****.:::'***|___|*****`:.****--~~                     
                           *.::'***//|___|\\\\*****`.*                           
                           .:'  **/##|___|##\\**    .                           
                                   .(v(VVV)___(VVV)v).                                   "                                                  
    end
    print box
  
end
def draw_hall_of_fame (ar)
  str = ar[0].to_s + ar[1].to_s + ar[2].to_s
  box = TTY::Box.frame(
      width: 30 ,
      height: 11,
      align: :center,
      padding: 3,
      title: {top_center: 'Hall Of Fame'},
      style: {
          fg: :bright_red,
          bg: :black,
          border: {
            fg: :bright_blue,
            bg: :black
          }
        }
    ) do
    str

    end
  print box
end

def welcome
    puts "W E L C O M E   T O"
    font = TTY::Font.new(:standard)
    pastel = Pastel.new
    puts pastel.yellow(font.write("GoT Trivia".center(TTY::Screen.width - 62)))
    #puts font.write("GOT Trivia)
    puts

end

def bar_init (number_of_questions_in_quiz)
    pastel = Pastel.new
    progress_color  = pastel.cyan("*")
    empty_color    = pastel.white("*")
    return  TTY::ProgressBar.new("Your progress [:bar] in the game", 
      total: number_of_questions_in_quiz, complete: progress_color,
      incomplete: empty_color)
end

def make_a_range(pages, number_of_choices, step = 100)
    r = rand(number_of_choices) + 1
    pages_floor = (pages/step).floor

    if pages_floor < number_of_choices
        puts "pages " + pages.to_s + ", floor " + pages_floor.to_s + ", step " + step.to_s +
        ", random place " + r.to_s + " in " + number_of_choices.to_s + " choices"
        return ["With this step and this amount of pages we don't have so many choices..",
            "please choose different step"]
    end

    pages_floor *= step

    ar =  []
    i = 1
    number_of_choices.times do
        limit_floor = pages_floor - (r - i)*step
        limit_ceil = limit_floor + step - 1
        ar << limit_floor.to_s + " to " + limit_ceil.to_s
        i += 1
    end
    return ar
end

def make_a_bet(prompt, account)
    puts
    if (account > 0)
        puts "You have " + account.to_s + " Gold Dragons. Choose your bet!"
    else
        return 0 
    end

    max_slider = account
    step_slider = 0

    #adjusting the siled width to the screen size
    if max_slider > (TTY::Screen.width - 30)
        while max_slider > (TTY::Screen.width - 30) do
            step_slider += 10
            max_slider  = account/step_slider
            #puts step_slider.to_s + " slider " + max_slider.to_s
        end
    else
        step_slider = 1
    end

    return prompt.slider("Your bet", min: step_slider,  max: account, step: step_slider, default: step_slider, format: "|:slider| %d")
     
end


