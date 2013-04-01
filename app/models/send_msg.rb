class SendMsg < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title  :string
    msg    :text
    mobile :text
    timestamps
  end
  attr_accessible :title, :msg, :mobile,:user,:user_id

  belongs_to :owner, :class_name => "User", :creator => true 

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
    owner_is?(acting_user)
  end

end
