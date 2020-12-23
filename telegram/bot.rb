# frozen_string_literal: true

require 'telegram/bot'

require_relative 'bot_case'

token = '1475023259:AAE6LSMdWffkJTgqclp7pIMFPvXXlfLzTdc'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |rqst|
    #case message.text
    #when '/start'
    #  user_message = "#{message.from.first_name}, Вітання!"
    #  user_message += 'Type /categories to get the list of categories'
    #  bot.api.send_message(chat_id: message.chat.id, text: user_message)
    #when '/categories'
      #show_root_categories(rqst, usr)
    #end
    Thread.start(rqst) do |rqst|
      usr = user(rqst)
      case_message(rqst, usr)
    end
  end
end
