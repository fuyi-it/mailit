class Tutorial < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title         :string
    tech_info     :string
    detail        :text
    download_url  :string
    category      enum_string(:"概述教程", :"安装教程", :"使用教程",:"其它教程") 
    memo          :text
    timestamps
  end
  attr_accessible :tech_info, :detail, :category, :memo,
                  :soft,:soft_id,:download_url,:title

  belongs_to :soft

  # --- Permissions --- #

  def create_permitted?
      acting_user.administrator? or  acting_user.role.name == 'tech'
  end

  def update_permitted?
      acting_user.administrator? or  acting_user.role.name == 'tech'
  end

  def destroy_permitted?
      acting_user.administrator? or  acting_user.role.name == 'tech'
  end

  def view_permitted?(field)
    true
  end

end
