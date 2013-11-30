class CreateGuestTable < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name, :token

      t.timestamps
      t.belongs_to :event

    end
  end
end
