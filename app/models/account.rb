class Account < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    account  :string
    password  :string
    balance :integer
    timestamps
  end
  attr_accessible :name,:account,:password,:balance,
     :adapter,:adapter_id,:user,:user_id

  belongs_to :adapter #account 用 adapter 来发送短信
  belongs_to :user

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
    acting_user.administrator?
  end

end
