class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  
  def index
    @requests = Request.all

  end

  
  def show
            @request = Request.find(params[:id])

  end

  
  def new
    @request = Request.new
  end

  
  def edit
  end

  
  def create
    @request = Request.new(request_params)

    
      if @request.save
        redirect_to @request, notice: 'Request was successfully created.' 
        
      else
        render :new 
       
    end
  end

 
  def update
   
      if @request.update(request_params)
        redirect_to @request, notice: 'Request was successfully updated.' 
       
      else
       render :edit 
       
    end
  end

  def destroy
    @request.destroy
    
     redirect_to requests_url, notice: 'Request was successfully destroyed.' 
    
  end

  private
   
    def set_request
      @request = Request.find(params[:id])
    end

    
    def request_params
      params.require(:request).permit(:from_name, :to_name, :status)
    end
end
