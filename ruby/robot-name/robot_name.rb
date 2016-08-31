
# Robots aware of their own existence
class Robot
  VERSION = 1

  attr_accessor :name

  @@robot_directory = []

  def initialize
    case
    when @@robot_directory.empty?
      Robot.directory_generator
    when @@robot_directory.size == 1
      # Prevent the directory from "looping around." IRL this would be
      # handled differently, but this class is most certainly not IRL
      raise "You've created too many robots! No more!"
    end
    @name = generate_name
  end

  def reset
    old_name = @name
    @name = generate_name
    @@robot_directory.push(old_name)
  end

  def self.directory_generator
    @@robot_directory = Array 'AA000'..'ZZ999'
  end

  private

  def generate_name
    name_index = rand(@@robot_directory.size)
    given_name = @@robot_directory[name_index]
    @@robot_directory.delete_at(name_index)
    given_name
  end
end
