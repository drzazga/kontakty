class AddCategoryToContact < ActiveRecord::Migration
  def self.up
    add_column :contacts, :category_id, :integer
  end

  def self.down
    remove_column :contacts, :category_id
  end
end
