
class EventCreator
  def initialize ()
    puts "Commençons la créaction de ton évènement !"
    puts "Quel est le titre de ton évènement ?"
    title = gets.chomp
    puts ""
    puts "Quand aura-t'il lieu ? (AAAA-MM-JJ HH:MM)"
    start_date = gets.chomp
    puts ""
    puts "Combien de temps va durer l'event ? (en minutes)"
    duration = gets.chomp.to_i
    puts ""
    puts "Qui va participer ? Donne les emails en séparant pas ' ; ' chaque mail."
    attendees = gets.chomp.split(" ; ")

    new_event = Event.new(start_date, duration, title,attendees)
    new_event.to_s
  end
end