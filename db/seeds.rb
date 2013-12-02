# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sample_host = Host.create name: "john", username: "johndoe", password: "pass", email: "goob@foob.com", phone: "5555555555"
sample_event = Event.create name: "john's camping trip", description: "going to yosemite", host_id: sample_host.id
sample_guest = Guest.create name: "bob", token: "greencheese", email: "someone@somewhere.com", event_id: sample_event.id
sample_item = Item.create name: "ribs", price: "3.24", description: "good ribs", guest_id: sample_guest.id, event_id: sample_event.id

another_event = Event.create name: "sespe backpacking", description: "Sespe Wilderness", host_id: sample_host.id
another_guest = Guest.create name: "george", token: "orange", email: "someone@somewhere.com", event_id: sample_event.id
unclaimed_item = Item.create name: "tent", description: "we need this tent", event_id: another_event.id
another_item = Item.create name: "stove", description: "to cook shit", guest_id: another_guest.id, event_id: another_guest.id