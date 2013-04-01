class PhoneKind < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    kind :string
    timestamps
  end
  attr_accessible :kind

  has_many :phone_numbers

  def name
    kind
  end

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
