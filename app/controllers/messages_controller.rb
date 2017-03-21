require 'rubygems'
require 'mechanize'
require 'open-uri'
class MessagesController < ApplicationController
  before_action :transalte_message, only: :create
  before_action :logged_in_user
  before_action :get_messages

  def index
    @logged_in_users = User.online
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'room_channel',
                                  message: render_message(message)
      message.mentions.each do |mention|
        ActionCable.server.broadcast "room_channel_user_#{mention.id}",
                                    mention: true,
                                    mentioner: current_user.username
      end
    end
  end

  private

    def render_message(message)
      render(partial: 'message', locals: { message: message })
    end

    def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end

    def message_params
      @transaltion ||= params.require(:message).permit(:content)
    end

    def transalte_message
      @transaltion = Hash.new(0)
      doc = Nokogiri::HTML(open(translate_api_uri))
      @transaltion[:content] = doc.css('blockquote').text.gsub(/\n| /,'').strip
    end

    def translate_api_uri
      agent = Mechanize.new
      agent.get("http://www.degraeve.com/translator.php")
      agent.page.forms[0]["w"] = params['message']['content']
      agent.page.forms[0]["url"] = ''
      agent.page.forms[0].radiobutton_with(value: current_user.dialect.key_name).check
      agent.page.forms[0].submit
      agent.page.uri
    end
end
