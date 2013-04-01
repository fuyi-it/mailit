  def prepare
  	u = acting_user
  	a = Account.where(user_id: u).first
  	ad = Adapter.where(id: a).first
  	p = SmsParam.where(id: ad,kind: "send_sms").first
    uri = URI(p.url)
    ps = {}  #msg =' #发送短信的参数 '
    ps[p.user] = ad.account_agent
    ps[p.pwd]  = ad.password
    ps[p.msg] = parmas[:msg].encode(p.encode)
    ps[p.mobile] = params[:mobile]

    orther_ps = orther_params(p.url_other)
    ps.merge!(orther_ps)

    res = Net::HTTP.post_form(uri,ps)
  end

  def orther_params(str)
    aa =  []
    str.split(',').each {|i|  aa << i.split('=')}
    Hash[*aa.flatten]
  end