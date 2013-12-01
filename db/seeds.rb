# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sample_host = Host.create name: "john", password: "pass", email: "goob@foob.com", phone: "5555555555"
sample_event = Event.create name: "johns bbq", description: "something", host_id: sample_host.id
sample_guest = Guest.create name: "bob", token: "greencheese", email: "someone@somewhere.com", event_id: sample_event.id
sample_item = Item.create name: "ribs", price: "3.24", description: "good ribs", guest_id: sample_guest.id, event_id: sample_event.id
