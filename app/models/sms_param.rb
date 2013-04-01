class SmsParam < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    kind enum_string(:"send_sms",:"check_balance",:"change_password")
    url :string
    user  :string
    pwd  :string
    msg  :string
    mobile  :string
    encode  :string
    url_other  :string
    is_post :boolean

    timestamps
  end
  attr_accessible :name,:kind,:url,:user,:pwd,:msg,:mobile,
      :encode,:url_other,:is_post,:adapter,:adapter_id

  belongs_to :adapter,:dependent => :destroy

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
