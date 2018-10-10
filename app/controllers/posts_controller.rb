class PostsController < ApplicationController
  def top
  	
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
  	if post.update(posts_parames)
  		flash[:notice] = "Book was successfully updated"
  	redirect_to post_path(post.id)
  end
  end

  def index
  	@post = Post.new
  	@posts = Post.all.order(created_at: :desc)
  end

  def create
  	post = Post.new(posts_parames)
  	if post.save
  		flash[:notice] = "Book was successfully created"
  	redirect_to post_path(post.id)


    end

  end

  def destroy
  	post = Post.find(params[:id])
  	if post.destroy
  		flash[:notice] = "Book was successfully destroyed"
  	redirect_to posts_path
    end
  end

  private
  def posts_parames
  	params.require(:post).permit(:title, :body)
  end

end
