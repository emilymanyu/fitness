class MicropostsController < ApplicationController
     before_action :logged_in_user, only: [:create, :destroy, :show, :index]
     before_action :correct_user,   only: :destroy 
      def create
        @micropost = Micropost.new(micropost_params)
        @micropost.user_id = current_user.id
        if @micropost.save
          flash[:success] = "Micropost created!"
          redirect_to root_url
        else
        	@feed_items = [] 
          render 'static_pages/home'
        end
      end

      def index
        @microposts = Micropost.all
      end

      def m_get_all_microposts
        @microposts = Micropost.all
        json_microposts = []
        @microposts.each do |micropost|
          micropost_json = {:content => micropost.content, :image => micropost.image.url}
          json_microposts.push(micropost_json);
        end
        render json: json_microposts
      end

      def show
        @micropost = Micropost.find(params[:id])
        @reviews = Review.where(micropost_id: @micropost.id)
      end

      def destroy
      	@micropost.destroy
            redirect_to root_url
      end
       private

            def correct_user
              @micropost = current_user.microposts.find_by(id: params[:id])
              redirect_to root_url if @micropost.nil?
            end

            def micropost_params
                params.require(:micropost).permit(:content,:image)
            end

    end