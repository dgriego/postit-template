class CommentsController < ApplicationController
  def create
    # redirect_to a url
    # always render a template

    # setup instance variable first
    # or instance variables
    # check if save was successful
    # if it was flash message and redirect
    # else render a page
    @post = Post.find(params[:post_id])
    # we want to attach the comment to a post (post_id, user_id)
    @comment = @post.comments.new(comment_params)

    if @comment.save # This is where the errors will be saved
      flash[:notice] = 'Your comment was added!'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private

  # we don't need this method if we are not reusing this, but
  # its still nice to keep to convention
  def comment_params
    params.require(:comment).permit(:body)
  end
end