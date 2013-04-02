class SendMsg < ActiveRecord::Base

  hobo_model # Don't put anything above this

  before_save   :assign_values
  after_create  :do_send_msg

  fields do
    title  :string
    msg    :text
    mobile :text
    num    :integer
    quantily :integer
    balance  :integer
    timestamps
  end
  attr_accessible :title, :msg, :mobile,:user,:user_id,:create_at,:quantily

  belongs_to :owner, :class_name => "User", :creator => true 

  def assign_values
    self.num = get_phone_count
    self.quantily = get_msg_count
    b = calc_balance 
    self.balance = b
    self.owner.update_attributes(:balance => b)
  end

  def do_send_msg


  end


  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? or acting_user.signed_up?
  end

  def update_permitted?
    acting_user.administrator? or acting_user.role.name == 'manager'
  end

  def destroy_permitted?
    acting_user.administrator? or acting_user.role.name == 'manager'
  end

  def view_permitted?(field)
    owner_is?(acting_user)
  end



  def get_phone_count
    i = self.mobile.split(',').size 
    j = self.mobile.split('\n').size 
    i > j ? i : j 
  end

  def get_msg_count
    i = self.msg.length.divmod(60)
    get_phone_count * ( i[1] == 0 ? i[0] : i[0] +1 )
  end

  def calc_balance
    b = User.find(self.owner_id).balance 
    b - get_msg_count
  end


end
