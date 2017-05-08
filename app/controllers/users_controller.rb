class UsersController < ApplicationController

	skip_before_action :user
	
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(permit_user)
    begin
      if @user.save
        session[:u] = @user
        respond_to do |format|
  		    format.html {redirect_to root_path(@user)}
          format.json {render json: @user}
        end
      else
        respond_to do |format|
          format.json {render json: '-1'}
        end
      end
    rescue 
  	 respond_to do |format|
        format.html {redirect_to about_posts_path}
        format.json {render json: "-1"}
      end
    end
  end

  def logout
    session[:u] = nil
    respond_to do |format|
      format.html {redirect_to root_path}
      format.json {render json: "-2"}
    end
  end

  def login
    @user = User.find_by(phoneno: params['phoneno'], password: params['password'])
    begin
      if @user
        session[:u] = @user
        respond_to do |format|
          format.html {redirect_to root_path}
          format.json {render json: @user}
        end
      else
        respond_to do |format|
          format.json {render json: "-1"}
        end
      end
    rescue
      respond_to do |format|
        format.json {render json: "-2"}
      end
    end
  end

  def createUser1
    #debugger
    @user = User.new(phoneno: params[:phoneno] , name: params[:name], password: params[:p])
    begin
      if @user.save
        respond_to do |format|
          format.json {render json: @user}
        end
      else
        respond_to do |format|
          format.json {render json: '-1'}
        end
      end
    rescue 
     respond_to do |format|
        format.json {render json: "-2"}
      end
    end
  end


  def alreadyexist
    @user = User.find_by(phoneno: params['phone'])
    begin      
      if @user
        respond_to do |format|
          format.json {render json: "1"}
        end
      else
        respond_to do |format|
          format.json {render json: "-1"}
        end
      end
    rescue
      respond_to do |format|
          format.json {render json: "-1"}
        end
    end
  end



  private
  	def permit_user
		params.require(:user).permit(:name,:phoneno,:password)
	end	
end

