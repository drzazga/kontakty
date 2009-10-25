class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street
      t.string :locality
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
