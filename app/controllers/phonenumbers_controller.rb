class PhonenumbersController < ApplicationController
  def new
  	@phonenumber = Phonenumber.new
  end

  def create
  	@phonenumber = Phonenumber.new(permit_phoneno)
  end

  def index
  end

  def verify
  	#debugger
  	@phonenumber = Phonenumber.find_by(phoneno: params['phoneno'] , pin: params['pin'])
  	if @phonenumber
  		respond_to do |format|
          format.json {render json: "1"}
        end
    else
    	respond_to do |format|
          format.json {render json: "-1"}
        end
  	end
  end

  private
	def permit_phoneno
		params.require(:phonenumber).permit(:phoneno , :pin ,:status)
	end
end
