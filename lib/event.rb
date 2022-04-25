require 'pry'
require 'time'

class Event
  attr_accessor :start_date, :duration, :title, :attendees
  @@event_count = 0
  @@event_list = []
  @@current_time = Time.now

  def initialize(start_date,duration,title,attendees)
    @start_date = Time.parse(start_date)
    @duration = duration.to_i
    @title = title
    @attendees = attendees
    @@event_count += 1
    @@event_list << self
  end

  ### ---- METHODES DE D"INSTANCE
  def end_date
    return start_date + duration * 60
  end

  def show_event
    puts self
  end

  def show_attendees
    puts @attendees
  end

  def add_attendent(new_attendent)
    if @attendees.include?(new_attendent.email)
      puts "#{new_attendent.email} participe déjà à l'evenement"
      else
      @attendees << new_attendent.email
      puts "#{new_attendent.email} à été ajouté à la liste d'invités de l'evenement"
    end
  end

  def postpone_24h
    @start_date += 24 * 60 * 60
    puts "L'évènement #{@title} est repoussé au #{@start_date}"
  end

  def is_past?
    return @start_date < @@current_time
  end

  def is_future?
    return @start_date > @@current_time
  end

  def is_soon?
    return @start_date - @@current_time <= 30 * 60 && self.is_future?
  end

  def to_s
    puts ">Titre : #{@title}"
    puts ">Date de début : #{@start_date.strftime "%Y-%m-%d %H:%M"}"
    puts ">Durée : #{@duration} minutes"
    puts ">Invités (#{@attendees.size}) : #{@attendees.join(", ").chomp(", ")}"
  end
  
  
  ### ---- METHODES DE CLASSES
  def self.current_time
    return @@current_time
  end

  def self.count
    return @@event_count
  end

  def self.all
    return @@event_list
  end

end