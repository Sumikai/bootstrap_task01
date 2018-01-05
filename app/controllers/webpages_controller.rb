class WebpagesController < ApplicationController
  #def set_blogを使うメソッドを一まとめにする
  before_action :set_webpage, only: [:show, :edit, :update, :destroy]
  
  def index
    @webpages = Webpage.all
  end
  
  def new
    if params[:back]
      @webpage = Webpage.new(blog_params)
    else
      @webpage = Webpage.new
    end
  end

  def create
    @webpage = Webpage.new(blog_params)
    if @webpage.save
      redirect_to webpages_path, notice: "記事を作成しました"
    else
      render 'new'
    end
  end
  
  def update
    if @webpage.update(blog_params)
      #ブログ一覧画面に戻ります
      redirect_to webpages_path, notice: "ブログを編集しました"
    else
      #編集画面を再描画します
      render 'edit'
    end
  end
  
  def destroy
    @webpage.destroy
    redirect_to webpages_path, notice: "記事を削除しました"
  end
  
  def confirm
    @webpage = Webpage.new(blog_params)
    render :new if @webpage.invalid?
  end
  
  private
    def webpage_params
      params.require(:webpage).permit(:title, :content)
    end
  
    #クリックした記事のみ取得する
    def set_webpage
      @webpage = Webpage.find(params[:id])
    end
end