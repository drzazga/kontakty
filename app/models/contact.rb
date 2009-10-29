class Contact < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :first_name, :surname
  
  def editor_ids
    ug = UserGroup.find_by_name('Administrators')
    p "JESTEM TU~!"
    @contact = Contact.find(self.id)
    [@contact.user_id] | ug.user_ids
  end
end
