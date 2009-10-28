class User < ActiveRecord::Base
  has_and_belongs_to_many :user_groups
  has_many :contacts
  
  acts_as_authentic
end
