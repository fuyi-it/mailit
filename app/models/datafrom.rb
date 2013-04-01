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
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
