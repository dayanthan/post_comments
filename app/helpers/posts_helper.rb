module PostsHelper
	def get_username(id)
	   @user=User.find_by_id(id)
	   username=@user.email.split('@')[0]
	end

	def comments_count(id)
		comment=Comment.where("post_id =?",id)
		comment.count
	end

	def check_staus(id)
		like=Like.find_by(user_id: current_user.id, post_id: id)
	end
	
	def like_count(id)
		like=Like.where("post_id=?",id)
		like.count
	end
end
