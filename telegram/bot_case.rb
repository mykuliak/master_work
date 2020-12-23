# frozen_string_literal: true

def case_message_text(rqst, usr)
  case rqst.text
  when '/start'
#   show_menu(rqst, usr)
    user_message = "#{usr.name}, Вітання!"
    user_message += "Type /categories to get the list of categories"
    send_message({chat_id: chat_id(rqst), text: user_message})
  when '/categories'    
    show_root_categories(rqst, usr)
  end
end


def show_root_categories(rqst, usr, action="next")
  kb = []
  Category.roots.each do |item|
    kb.push(Telegram::Bot::Types::InlineKeyboardButton.new(text: item.name, callback_data: "action = next & next = category_#{item.id}"))
  end

  markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
  user_message = 'Основні категорії:'
  if action == "next"
    send_message({chat_id: chat_id(rqst), text: user_message, reply_markup: markup})
  else
    last_bot_message_id_to_user = rqst.message.message_id
    bot.api.editMessageReplyMarkup(chat_id: rqst.from.id, message_id: last_bot_message_id_to_user, text: user_message, reply_markup: markup)
  end
end