class SendSMS
  require 'twilio-ruby'
    
  def self.send(phone_number, message)
    sid = 'AC3dc7e97d433a32cf4e6361cb2e451cae'
    token = 'fb5005deac96304d3473367195b205f6'
    client = Twilio::REST::Client.new sid, token    
    client.messages.create(
    :from => Rails.application.secrets.twilio_from,
    :to   => '+1' + phone_number,
    :body => message )
  end
end