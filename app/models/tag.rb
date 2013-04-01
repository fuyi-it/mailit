class Tag < ActiveRecord::Base

  hobo_model # Don't put anything above this
  
  set_default_order :name

  fields do
    name :string
    timestamps
  end
  attr_accessible :name

  has_many :tag_assignments,:dependent=>:destroy
  has_many :customers,:through => :tag_assignments
  children :customers

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? or acting_user.role.name = 'data'
  end

  def update_permitted?
    acting_user.administrator? or  acting_user.role.name = 'data'
  end

  def destroy_permitted?
    acting_user.administrator? or  acting_user.role.name = 'data'
  end

  def view_permitted?(field)
    true
  end

end
