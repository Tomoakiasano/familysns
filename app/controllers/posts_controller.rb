class PostsController < ApplicationController
	before_action :set_post, only:[:edit, :update, :destroy]
	before_action :authenticate_user!
	before_action :correct_user, only:[:edit, :update]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to post_path(@post.id)
		else
			redirect_to new_post_path
		end
		# if @post.save
		# 	redirect_to @post
		# else
		# 	redirect_to new_post_path
		# end
	end

	def edit
		
	end

	def show
		@post = Post.find(params[:id])
	end

	def update
		@post.update(post_params)
		redirect_to post_path(@post.id)
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

  private

	def post_params
		params.require(:post).permit(:title, :name, :user_id, :image)
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def correct_user
		post = Post.find(params[:id])
		if current_user.id != post.user.id
			redirect_to root_path
		end
	end


end
