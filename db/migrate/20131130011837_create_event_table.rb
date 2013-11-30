class CreateEventTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :address, :city, :state, :description
      t.integer :expected_attendance, :zip

      t.timestamps
      t.belongs_to :host
    end
  end
end
