#encoding : utf-8
module ApplicationHelper
	MINIUTE = 60
	HOUR = 60*MINIUTE
	DAY = 24*HOUR
	MOUTH = 30*DAY
	YEAR = 12*MOUTH
	def full_title(page_title)
		base_title = "Ruby on Rails Tutorial Sample App"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def time_ago_in_words_for_zh(time)
		diff = Time.now - time
		if diff >= YEAR
			num = diff / YEAR
			return "#{num.to_i}年"
		elsif diff >= MOUTH
			num = diff / MOUTH
			return "#{num.to_i}个月"
		elsif diff >= DAY
			num = diff / DAY
			return "#{num.to_i}天"
		elsif diff >= HOUR
			num = diff / HOUR
			min = (diff % HOUR)/MINIUTE
			return "#{num.to_i}小时#{min.to_i}分钟"
		elsif diff >= MINIUTE
			num = diff / MINIUTE
			return "#{num.to_i}分钟"
		else 
			return "#{diff.to_i}秒钟"	
		end
	end
end
