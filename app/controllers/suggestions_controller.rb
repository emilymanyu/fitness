class SuggestionsController < ApplicationController
	def create
    @request = Request.find(params[:request_id])
    @suggestion = @request.suggestions.create(suggestion_params)
    @suggestion.user_id=current_user.id
    @suggestion.save
    redirect_to request_path(@request)
  end
 def destroy
    @plan = Plan.find(params[:plan_id])
    @suggestion = @plan.suggestions.find(params[:id])
    @suggestion.destroy
    redirect_to request_path(@request)
  end
  private
    def suggestion_params
      params.require(:suggestion).permit(:content,:request_id,:user_id)
    end

end
