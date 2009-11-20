class Contact < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  belongs_to :category
  validates_presence_of :first_name, :surname
  
  def editor_ids
    ug = UserGroup.find_by_name('Administrators')
    @contact = Contact.find(self.id)
    [@contact.user_id] | ug.user_ids
  end
end
