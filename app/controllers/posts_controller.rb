class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	
	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		if @post.save
		  redirect_to post_path(@post)
	    else
		  render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
		redirect_to post_path(@post)
	    else
	    	render :edit
	    end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			redirect_to posts_path
		else
			render :new
		end
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :author, :body)
	end
end
