class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end
  
  def index
    @posts = Post.page(params[:page]).reverse_order.per(10)
  end
  
  def categorys
  
  end
  
  def category
    @category = params[:category] #categoryを取得
    if @category == "JapaneseFood"
      @posts = Post.where(category:"1").page(params[:page]).reverse_order.per(10)
    elsif @category == "WesternCuisine"
      @posts = Post.where(category:"2").page(params[:page]).reverse_order.per(10)
    elsif @category == "ChineseFood"
      @posts = Post.where(category:"3").page(params[:page]).reverse_order.per(10)
    elsif @category == "AsianFood"
      @posts = Post.where(category:"4").page(params[:page]).reverse_order.per(10)
    elsif @category == "Curry"
      @posts = Post.where(category:"5").page(params[:page]).reverse_order.per(10)
    elsif @category == "Meat"
      @posts = Post.where(category:"6").page(params[:page]).reverse_order.per(10)
    elsif @category == "Drink"
      @posts = Post.where(category:"7").page(params[:page]).reverse_order.per(10)
    elsif @category == "Cafe"
      @posts = Post.where(category:"8").page(params[:page]).reverse_order.per(10)
    elsif @category == "Sweets"
      @posts = Post.where(category:"9").page(params[:page]).reverse_order.per(10)
    elsif @category == "Noodles"
      @posts = Post.where(category:"10").page(params[:page]).reverse_order.per(10)
    elsif @category == "Bar"
      @posts = Post.where(category:"11").page(params[:page]).reverse_order.per(10)
    elsif @category == "Buffet"
      @posts = Post.where(category:"12").page(params[:page]).reverse_order.per(10)
    elsif @category == "Family"
      @posts = Post.where(category:"13").page(params[:page]).reverse_order.per(10)
    elsif @category == "Restaurant"
      @posts = Post.where(category:"14").page(params[:page]).reverse_order.per(10)
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end 
  
  def edit
    @post = Post.find(params[:id])
    
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:shop_name, :image, :caption, :category)
  end
end
