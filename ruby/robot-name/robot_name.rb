include ObjectSpace


class Robot
  

  VERSION = 1
  
  attr_accessor :name


  def initialize
    @name = new_name
  end

  def reset
    @name = new_name
  end

  private
  
  def new_name
    #First flush and update list of existing robots
    @bot_list = []
    ObjectSpace.each_object(Robot) { |bot| @bot_list.push(bot.name) }

    #Then create name, check to see if it's on the list.
    proposed_name = name_generator

    #If there are to be a lot of robots, there probably should be some
    #sort of escape conditon from this loop.
    if @bot_list.include?(proposed_name) then new_name
    else proposed_name
    end
    
  end


  def name_generator
    new_string = ""
    2.times {new_string << ('A'..'Z').to_a[rand(26)]}
    3.times {new_string << rand(10).to_s}
    new_string
  end
  
end
