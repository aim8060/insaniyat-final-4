class PostsController < ApplicationController
  def new
    @user = User.find(params[:id])
  	@post = @user.posts.build
  end

  def makepostnot
    begin
      @user = User.find(params[:id])
      @post = @user.posts.build(status: params[:status],image: params[:img],place: params[:place],city: params[:city],relation: params[:relation],gender: params[:gender],age: params[:age],name:params[:name],fathername:params[:fathername],clothes: params[:clothes],requestdate:params[:date],mentalstatus:params[:mentalstatus], clothescolor:params[:clothescolor],description: params[:desc],contact: params[:contact])
      if @post.save
        respond_to do |format|
          format.html {redirect_to root_path}
          format.json {render json: @post}
        end
      else
        respond_to do |format|
          format.html {redirect_to root_path}
          format.json {render json: "-1"}
        end
      end
    rescue
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json {render json: "-2"}
      end
    end
  end

  def makepost
    begin
      @user = User.find(params[:id])
      @post = @user.posts.build(permit_post)
      if @post.save
        respond_to do |format|
          format.html {redirect_to root_path}
          format.json {render json: @post}
        end
      else
        respond_to do |format|
          format.html {redirect_to root_path}
          format.json {render json: "-1"}
        end
      end
    rescue
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json {render json: "-2"}
      end
    end
  end

  def index
    if params[:id] == 'getmiss'
      @posts = Post.where(:status => 'lost').order("created_at DESC").paginate(page: params[:page], per_page: 9)
    elsif params[:id] == 'getfound'
      @posts = Post.where(:status => 'found').order("created_at DESC").paginate(page: params[:page], per_page: 9)
    else
      @posts = Post.where(:status => 'lost').order("created_at DESC").paginate(page: params[:page], per_page: 9)
    end
    respond_to do |format|
        format.html 
        format.json {render json: @posts}
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  def about
  end
  
  def getDetail
    @post = Post.find(params[:getD]) # file_name is the data key of Ajax request in view

    respond_to do |format|
      format.html 
      format.json { render json: @post }
    end
  end

  def threemissing
    @posts = Post.where(:status => 'lost').order("created_at DESC").limit(3);
    respond_to do |format|
        format.json {render json: @posts}
    end
  end

  def threefound
    @posts = Post.where(:status => 'found').order("created_at DESC").limit(3);
    respond_to do |format|
        format.json {render json: @posts}
    end
  end

  def getallmissing
    @posts = Post.where(:status => 'lost').order("created_at DESC");
    respond_to do |format|
        format.html {redirect_to root_path(@post)}
        format.json {render json: @posts}
    end
  end

  def getallfound
    @posts = Post.where(:status => 'found').order("created_at DESC");
    respond_to do |format|
        format.html {redirect_to root_path(@posts)}
        format.json {render json: @posts}
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post
      @post.destroy
    end
    redirect_to admin_index_path
  end

	private
		def permit_post
			params.require(:post).permit(:status,:requestdate,:place,:city,:relation,:gender,:mentalstatus,:name,:fathername,:age,:clothes,:clothescolor,:description,:image,:contact,:user_id)
		end
end