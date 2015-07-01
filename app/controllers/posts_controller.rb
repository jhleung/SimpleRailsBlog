class PostsController < ApplicationController
	def index
		@posts = Post.all
		if params[:search]
  		  @posts = Post.search(params[:search]).order("created_at DESC")
 		 else
  		  @posts = Post.all.order('created_at DESC')
  		end
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@comment.post_id = @post_id
	end

	def new
		@post = Post.new
		# Post.destroy_all()
	end

	def create
		#render text: params[:post].inspect
		@post = Post.new(post_params)
		@post.save
		# if @post.save
		redirect_to root_path
		# end
	end

	def post_params
    	params.require(:post).permit(:title, :body)
  	end

  	def edit
  		@post =	Post.find(params[:id])
	end

	def update
	  	@post = Post.find(params[:id])
	  	@post.update(post_params)

	 	 redirect_to post_path(@post)
	end

  	def destroy
  	  	@post = Post.find(params[:id])
   	  	Post.destroy(@post)
   	  	redirect_to root_path
  	end

end
