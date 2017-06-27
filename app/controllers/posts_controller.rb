class PostsController < ApplicationController
  def index
    filtered_posts = Post.all.sort_by.sort { |a, b| b.score <=> a.score }
    @posts = filtered_posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.score = 0;
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def upvote
    @post = Post.find(params[:post_id])
    new_score = @post.score += 1
    @post.update(score: new_score)
    puts("********************************************")
    puts(@post.score)
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :author, :content)
  end
end
