class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    if message_params[:to].class == String
      Message.create(message_params)
    else
      message_params[:to].each do |number|
        Message.new(to: number, from: message_params[:from], body: message_params[:body]).save
    end
  end
    # @message = Message.new(message_params)
    #
    # if @message.save
    #   flash[:notice] = "Your message was sent!"
    #   redirect_to messages_path
    # else
    #   render "new"
    # end

    redirect_to user_messages_path(current_user)
  end

  def show
    @message = Message.find(params[:id])
  end

  private

    def message_params
      params.require(:message).permit(:to, :from, :body, :phone, :to => [])
    end
end
