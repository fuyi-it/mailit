class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name     :string
    contact  :string
    http     :string
    qq_group :string
    timestamps
  end
  attr_accessible :name, :contact, :http, :qq_group,:softs

  has_many :softs

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? or  acting_user.role.name == 'tech'
  end

  def update_permitted?
    acting_user.administrator? or  acting_user.role.name == 'tech'
  end

  def destroy_permitted?
    acting_user.administrator? 
  end

  def view_permitted?(field)
    acting_user.administrator? or  acting_user.role.name == 'tech'
  end

end
