require 'rails_helper'

describe Message do
  it 'doesn\'t save message if twilio gives an error' do
    message = Message.new(body: 'body', from: '4155992671', to: '1111111111')
    message.save.should be false
  end
end
