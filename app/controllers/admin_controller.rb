class AdminController < ApplicationController

	def index
		if params[:id] == 'getmiss'
      @posts = Post.where(:status => 'lost').order("created_at DESC").paginate(page: params[:page], per_page: 12)
    elsif params[:id] == 'getfound'
      @posts = Post.where(:status => 'found').order("created_at DESC").paginate(page: params[:page], per_page: 12)
    else
      @posts = Post.where(:status => 'lost').order("created_at DESC").paginate(page: params[:page], per_page: 12)
    end
    respond_to do |format|
        format.html 
        format.json {render json: @posts}
    end
	end

	def allusers
		@users = User.order("created_at DESC").paginate(page: params[:page], per_page: 20)
		respond_to do |format|
        format.html 
        format.json {render json: @users}
    end
	end
end
