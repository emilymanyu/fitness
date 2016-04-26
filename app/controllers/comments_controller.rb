class CommentsController < ApplicationController
	def create
    @course = Course.find(params[:course_id])
    @comment = @course.comments.create(comment_params)
    @comment.user_id=current_user.id
    @comment.save
    redirect_to course_path(@course)
  end
 def destroy
    @course = Course.find(params[:course_id])
    @comment = @course.comments.find(params[:id])
    @comment.destroy
    redirect_to course_path(@course)
  end
  private
    def comment_params
      params.require(:comment).permit(:content,:course_id,:user_id)
    end

end
