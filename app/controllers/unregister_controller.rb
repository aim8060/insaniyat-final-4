class UnregisterController < ApplicationController

  def new
  	@unregister = Unregister.new
	end

	def create
  	debugger
	  @unregister = Unregister.new(params[:unregister])
	  begin
	    if @unregister.save
	      respond_to do |format|
	        format.json {render json: @unregister}
	      end
	    end
	  rescue 
	  	respond_to do |format|
	      format.json {render json: "-1"}
	    end
	  end
  end

  def createUser
  	@unregister = Unregister.new(phoneno: params[:phoneno] , name: params[:name])

	  if @unregister.save
      respond_to do |format|
        format.json {render json: @unregister}
      end
		else
			respond_to do |format|
		    format.json {render json: "-1"}
	    end
	  end
  end

  def index
  end

  def show
  end

  private
  	def permit_unregister
		params.require(:unregister).permit(:name,:phoneno)
	end

end
