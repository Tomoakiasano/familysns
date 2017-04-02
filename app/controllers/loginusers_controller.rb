class LoginusersController < ApplicationController
	before_action :authenticate_user!

	def index
		
	end

	def new
		@post = Post.new
	end

	def create
	# 	@post = Post.new(post_params)
	# 	@post.user_id = current_user.id
	# 	@post.save
	# 	redirect_to loginuser_path(@post.id)
	end

	def edit
		
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	
	def post_params
		params.require(:post).permit(:title, :name, :user_id)
	end
end
