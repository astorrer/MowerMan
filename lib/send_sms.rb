class SendSMS
  require 'twilio-ruby'

  def self.send(phone_number, message)
    sid = Rails.application.secrets.twilio_sid
    token = Rails.application.secrets.twilio_token
    client = Twilio::REST::Client.new sid, token    
    client.messages.create(
    :from => Rails.application.secrets.twilio_from,
    :to   => '+1' + phone_number,
    :body => message )
  end
end
