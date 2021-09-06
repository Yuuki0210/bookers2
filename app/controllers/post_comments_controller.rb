class PostCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = @book.id
    comment.save
    redirect_to book_path(@book)

  end

  def destroy
    #Book.find_by(id: params[:id], book_id: params[:book_id]).destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.post_comments.find(params[:id])
    book_comment.destroy
    redirect_to book_path(params[:book_id])
  end

 private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
