require 'rails_helper'

describe Message, vcr: true do
  it 'doesn\'t save message if twilio gives an error' do
    message = Message.new(body: 'body', from: '4155992671', to: '1111111111')
    message.save.should be false
  end

  it 'gives an error if the number is invalid' do
    message = Message.new(body: 'body', from: '4155992671', to: '111111')
    message.save
    message.errors[:base].should eq ["The 'To' number 111111 is not a valid phone number."]

  end
end
