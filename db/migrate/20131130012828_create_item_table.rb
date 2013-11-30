class CreateItemTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :price, :description
      t.integer :host_id
      t.integer :guest_id
      t.belongs_to :event
      t.timestamps
    end
  end
end
