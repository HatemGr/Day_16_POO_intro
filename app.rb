# lignes qui appellent les gems du Gemfile
require 'bundler'
Bundler.require

# lignes appellant les classes dans le dossier lib/
require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/eventcreator'
require_relative 'lib/calendardisplayer'

hatem = User.new("hatem@gribi.com", 31)
paul = User.new("paul@mirabel.fr", 35)
yasmine = User.new("yasmine@letaief.com",12)

soiree_play = Event.new("2022-04-24 13:30", 120, "Jouer Pepouz",[hatem.email])
soiree_play_2 = Event.new("2022-04-24 13:30", 120, "Jouer Pepouz",[hatem.email])
anniv_yasmine = Event.new("2022-04-22 14:40",180, "Anniv Yasmine bien",[yasmine.email])
other = Event.new("2022-04-23 14:40",180, "Evenement Autre",[yasmine.email,paul.email])

# soiree_play.add_attendent(paul)
# anniv_yasmine.add_attendent(hatem)
# anniv_yasmine.add_attendent(hatem)
# anniv_yasmine.postpone_24h

# target = User.find_by_mail("hatem@gribi.com")
# puts target.age

# EventCreator.new
# puts "-" * 50
# puts Event.all.select {|event| event.start_date.day == 16}


calendar = CalendarDisplayer.new(Event.all)
# puts calendar.horizontal_line
# puts calendar.day_number_line(1,7)
# puts calendar.day_number_line(8,14)
# puts calendar.count_event_day(23)
# puts calendar.text_at_day(24).size

calendar.display()
