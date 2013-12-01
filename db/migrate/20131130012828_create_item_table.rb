class CreateItemTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :price, :description
      t.integer :host_id
      t.integer :guest_id
      t.belongs_to :event
      t.boolean :important, :null => false, :default => false
      t.boolean :purchased, :null => false, :default => false
      t.timestamps
    end
  end
end
