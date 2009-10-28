class Contact < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :first_name, :surname
end
