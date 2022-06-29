class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to store_path(@comment.store)
    else
      @store = @comment.store
      @comments = @store.comments
      render "stores/show" 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, store_id: params[:store_id])
  end

end
