class Datafrom < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    detail :string
    timestamps
  end
  attr_accessible :name,:detail

  has_many :customers

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? or  acting_user.role.name == 'manager'
  end

  def update_permitted?
    acting_user.administrator? or  acting_user.role.name == 'manager'
  end

  def destroy_permitted?
    acting_user.administrator? or  acting_user.role.name == 'manager'
  end

  def view_permitted?(field)
    true
  end

end
