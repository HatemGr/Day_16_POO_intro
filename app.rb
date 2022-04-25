# lignes qui appellent les gems du Gemfile
require 'bundler'
Bundler.require

# lignes appellant les classes dans le dossier lib/
require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/eventcreator'
require_relative 'lib/calendardisplayer'

# --- CREATION DES USERS
user_1 = User.new("user_1@email.com", 5)
user_2 = User.new("user_2@email.fr", 10)
user_3 = User.new("user_3@email.com",15)
user_4 = User.new("user_4@email.fr",20)
user_5 = User.new("user_5@email.fr",25)

# --- CREATION DES USERS
event_1 = Event.new("2022-04-01 13:30", 120, "RDV medecin",[user_1.email])
event_2 = Event.new("2022-04-07 13:30", 120, "Meeting important",[user_1.email])
event_3 = Event.new("2022-04-11 14:40",180, "Anniv de user_4",[user_3.email])
event_4 = Event.new("2022-04-11", 600, "Date avec Manon", [user_4.email])
event_5 = Event.new("2022-04-23 16:00",180, "Vernis de Sophie",[user_3.email,user_2.email])

# --- MANIPULATION DES EVENTS
event_3.add_attendent(user_1)
event_3.add_attendent(user_2)
event_3.postpone_24h

# --- RECHECHE D'UN USER
target = User.find_by_mail("user_1@email.com")
puts "Le user recherché a #{target.age} ans"

# --- AFFICHAGE CALENDAIRE
calendar = CalendarDisplayer.new(Event.all)
calendar.display()
