require 'pry'


class User # --- La Classe
  attr_accessor :email, :age # --- Les variables d'instance
  @@user_count = 0 # --- Les variables de classe
  @@user_list = []

  def initialize(email_to_save, age_to_save) # --- Les methodes d'instance
    @email = email_to_save # --- Les variables d'instance
    @age = age_to_save
    @@user_count = @@user_count + 1 # --- Les variables de classe
    @@user_list << self
  end

  def to_s
    puts "Email: #{@email}"
    puts "Age : #{@age}"
  end
  
  def show_itself
    puts self
  end

  def self.count # --- Les methodes de classe
    return @@user_count
  end

  def self.all
    return @@user_list
  end

  def self.find_by_mail (email)
    target = "None"
    @@user_list.each {|user| user.email == email ? target = user : user }
    return target
  end

  private


end