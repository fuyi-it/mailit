class Soft < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name     :string
    download :string
    register :string
    run      :string
    memo     :text
    timestamps
  end
  attr_accessible :name, :download, :register, :run, :memo,
      :project,:project_id,:cate_one,:cate_one_id,:tutorials

  belongs_to :project
  has_many :tutorials

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?  or  acting_user.role.name = 'tech'

  end

  def update_permitted?
    acting_user.administrator? or  acting_user.role.name = 'tech'
  end

  def destroy_permitted?
    acting_user.administrator? or  acting_user.role.name = 'tech'
  end

  def view_permitted?(field)
     acting_user.administrator? or  acting_user.role.name = 'tech'
  end

end
