class Actor < ActiveRecord::Base
  has_many :characters
  #this below is saying an actor has many shows but we need to go THROUGH the characters table
  has_many :shows, through: :characters

    #returning actor first and last name
  def full_name
    "#{first_name} #{last_name}"
  end

  #listing all roles an actor has- they want an array and the show name
  #they wanted an array of all this thats why the last line is the variable we assigned to the array
  def list_roles 
    roles = []
    self.characters.map do |charachter|
        roles << "#{character.name} - #{character.show.name}"
    end
    roles
  end
end