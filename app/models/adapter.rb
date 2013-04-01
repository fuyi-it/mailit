class Adapter < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    account_agent  :string #我们在上家的账号
    password :string
    balance :integer
    timestamps
  end
  attr_accessible :name,:account_agent,:password,:balance,
      :accounts,:sms_params

  has_many :accounts
  has_many :sms_params
  children :sms_params

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
