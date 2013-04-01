class Customer < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name     :string
    email    :string
    qq       :string
    http     :string
    tagstring :string
    detail   :text
    timestamps
  end
  attr_accessible :name, :email, :qq, 
        :detail,:http,:tagstring,:datafrom,:datafrom_id,:tags,:phone_numbers

  belongs_to :datafrom
  has_many :tag_assignments,:dependent => :destroy
  has_many :tags,:through => :tag_assignments,:accessible => true

  has_many :phone_numbers
  children :phone_numbers

  has_many :accounts #用于发信扣量的帐号


  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? or  acting_user.role.name = 'data'
  end

  def update_permitted?
     acting_user.administrator? or  acting_user.role.name = 'data'
  end

  def destroy_permitted?
     acting_user.administrator? or  acting_user.role.name = 'manager'
  end

  def view_permitted?(field)
     acting_user.administrator? or  acting_user.role.name = 'data'
  end

end
