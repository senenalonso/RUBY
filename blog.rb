require 'colorize'

class Blog
	def initialize
		@posts = []
		@pagination = 3
		@page = 1
		@pages = 1
		@total_posts = 0
	end	

	def add_post(post)
		@posts.push(post)
		@total_posts += 1		
	end
	def publish_front_page
		puts "\n\n"
		puts "#########################################"
		puts "#########################################"
		puts "##                                     ##"
		puts "##       N E N ' S     B L O G         ##".colorize(:blue)
		puts "##                                     ##"
		puts "#########################################"
		puts "#########################################"
		puts "\n\n"
		print_posts
	end

	def print_posts
		from = ((@page-1) * @pagination)
		to = ((@page * @pagination) -1)
		if to > @total_posts-1
			to = @total_posts-1
		end
		until from>to do 
			@posts[from].print_post
			from += 1			
		end
		print_pagination
		ask_user
	end

	def print_pagination		

		if @posts.size % @pagination > 0
			@pages = @posts.size/@pagination+1
		else
			@pages = @posts.size/@pagination
		end

		for i in 1..@pages
			if i==@page
				print "  #{i.to_s.colorize(:red)}  " 
   			else 
   				print "  #{i}  "
   			end
		end
	end

	def ask_user
		puts "next || prev ??"
		move = gets.chomp
		if move == "next" && @page<@pages
			@page +=1
		elsif move =="prev" && @page>1
			@page -=1
		else
			puts "Bad answer. GoodBye!!!!"
		end
		print_posts
	end
end

class Post
	def initialize(title, text, date)
		@title = title
		@text = text
		@date = date	
		sleep(1)	
	end

	def print_post
		print_title
		print_text
	end

	def print_title
		puts "#{@title.colorize(:green)}: (#{@date.strftime("%d-%m-%Y %H:%M:%S")})"
		puts "**********************".colorize(:green)
	end

	def print_text
		puts @text
		puts "----------------------\n\n"
	end
end

class SponsoredPost < Post
	def print_title
		puts "=====#{@title.colorize(:yellow)}: (#{@date.strftime("%d-%m-%Y %H:%M:%S")})========"
		puts "=====================".colorize(:yellow)
	end	
end

blog = Blog.new
blog.add_post Post.new("Post title 1","Post 1 text",Time.now)
blog.add_post SponsoredPost.new("Post title 2","Post 2 text",Time.now)
blog.add_post Post.new("Post title 3","Post 3 text",Time.now)
blog.add_post SponsoredPost.new("Post title 4","Post 4 text",Time.now)
blog.add_post Post.new("Post title 5","Post 5 text",Time.now)
blog.add_post SponsoredPost.new("Post title 6","Post 6 text",Time.now)
blog.add_post Post.new("Post title 7","Post 7 text",Time.now)
blog.add_post SponsoredPost.new("Post title 8","Post 8 text",Time.now)
blog.add_post Post.new("Post title 9","Post 9 text",Time.now)
blog.add_post Post.new("Post title 10","Post 10 text",Time.now)


blog.publish_front_page

