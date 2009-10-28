class User < ActiveRecord::Base
  has_many :contacts
  acts_as_authentic
end
