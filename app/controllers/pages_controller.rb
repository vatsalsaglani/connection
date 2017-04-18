class PagesController < ApplicationController


  def index
  end

  def home
    @posts = Post.all
    @newPost = Post.new
    @random_post = Post.where.not(id: @post).order("RANDOM()").first
    @random_post1 = Post.where.not(id: @random_post).order("RANDOM()").first

  end

  def profile

    if(User.find_by_username(params[:id]))
      @username = params[:id]


    else
      redirect_to root_path, :notice => "User not Found!!"
    end
    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @newPost = Post.new

  end

  def explore
    @posts = Post.all
  end



  

  private

    def find_post
      @post = Post.find(params[:user_id])

    end
end
