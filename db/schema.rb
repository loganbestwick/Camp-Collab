ActiveRecord::Schema.define(:version => 20131201231937) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "description"
    t.integer  "zip"
    t.boolean  "completed",   :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "host_id"
    t.string   "camp_site"
  end

  create_table "guests", :force => true do |t|
    t.string   "name"
    t.string   "token"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "event_id"
  end

  create_table "hosts", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "price"
    t.string   "description"
    t.integer  "host_id"
    t.integer  "guest_id"
    t.integer  "event_id"
    t.boolean  "important",   :default => false, :null => false
    t.boolean  "purchased",   :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "organizers", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
