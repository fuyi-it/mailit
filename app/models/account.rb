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
  belongs_to :user    #用户的帐号，以便计算短信用量 不能用 :creator

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?  or  acting_user.role.name == 'manager'
  end

  def update_permitted?
    acting_user.administrator?  or  acting_user.role.name == 'manager'
  end

  def destroy_permitted?
    acting_user.administrator? or  acting_user.role.name == 'manager'
  end

  def view_permitted?(field)
    acting_user.administrator? or  acting_user.role.name == 'manager'
  end

end
