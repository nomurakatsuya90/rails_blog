class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  def index
    @blog_contents = BlogContent.all
  end

  def new
    @blog_content = BlogContent.new
  end
  def create
    @blog_content = BlogContent.new(blog_params)
    if @blog_content.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render :new  #同画面を再描画
    end
  end

  def edit  #before_actionでのset_blogのみ k.nomura
  end
  def update
    if @blog_content.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def confirm
    @blog_content = BlogContent.new(blog_params)
    render :new if @blog_content.invalid? 
  end

  def destroy
    @blog_content.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  
  private
  def blog_params
    params.require(:blog_content).permit(:content) #一度コンソール上でparameterを確認する
  end
  def set_blog
    @blog_content = BlogContent.find(params[:id])
  end
end

