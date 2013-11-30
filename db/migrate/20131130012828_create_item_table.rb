class CreateItemTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :price, :description

      t.timestamps
      t.belongs_to :event
      t.belongs_to :guest
    end
  end
end
