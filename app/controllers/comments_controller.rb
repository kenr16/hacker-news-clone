class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.new(comment_params)
    @comment.reply_id = params[:comment][:reply_id].to_i
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

  def reply
    @post = Post.find(params[:post_id])
    @oldComment = Comment.find(params[:comment_id])
    @comment = Comment.new()
    @comment.reply_id = @oldComment.id
  end

  # def post_reply
  #   @post = Post.find(params[:post_id])
  #   @originalComment = Comment.find(params[:comment_id])
  #   puts @originalComment
  #   comment = Comment.new(comment_params)
  #   comment.reply_id = @originalComment.id;
  #   if comment.save
  #     redirect_to post_path(@originalComment.post)
  #   else
  #     render :reply
  #   end
  # end

private
  def comment_params
    params.require(:comment).permit(:author, :text, :reply_id)
  end

end
