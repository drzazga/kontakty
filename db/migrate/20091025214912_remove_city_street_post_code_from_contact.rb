class RemoveCityStreetPostCodeFromContact < ActiveRecord::Migration
  def self.up
    remove_column :contacts, :city
    remove_column :contacts, :street
    remove_column :contacts, :post_code
  end

  def self.down
    add_column :contacts, :post_code, :string
    add_column :contacts, :street, :string
    add_column :contacts, :city, :string
  end
end
