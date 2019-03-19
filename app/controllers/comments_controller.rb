class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def all_comments
    @comments = Comment.where("post_id=?",params[:id])
    @post=Post.find_by_id(params[:id])
     respond_to do |format|
      format.html
      format.js
    end
  end

  def new_comment
     @comments= Comment.create(:body=>params[:body], :post_id=>params[:post_id], :user_id=>params[:user_id])
     respond_to do |format|
        format.html 
        format.js { render js: 'window.top.location.reload(true);' }
     end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
