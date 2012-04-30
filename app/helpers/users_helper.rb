module UsersHelper
	def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

	def checkout_notify_content(notification)
		source_id = notification.source_id
		s = notification.source
		if s == "Reply"
			return Reply.find_by_id(source_id).content
		elsif s== "Message"
			return Message.find_by_id(source_id).content
		end
	end


	def checkout_notify_path(notification) 
		source_id = notification.source_id
		s = notification.source
		if s == "Reply"
			micropost_id = Reply.find_by_id(source_id).micropost_id
			return micropost_replies_path(micropost_id)	
		elsif s == "Message"
			return message_path(source_id)	
		end
	end
end
