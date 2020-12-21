class HompageController < ApplicationController
  # Trang Chu ########################
  def index
    # xuat danh sach bai viets
    @news = Article.includes(:categories).where(status: "public").limit(3)
    @news1 = Article.where(status: "public").order(created_at: :DESC).limit(6)
    @news2 = Article.where(status: "public").order(created_at: :ASC).limit(6)
    @news3 = Article.where(status: "public").order(created_at: :DESC).limit(6)
    @cate = Category.includes(:children).where(parent_id: params[nil])
    @cate1 = Category.order(created_at: :DESC).limit(1)
    @cate2 = Category.order(created_at: :ASC).limit(4)
    @allcate = Category.all
    
  end
################# show each post func
  def showpost
    @cate = Category.includes(:children).where(parent_id: params[nil])  
    @news = Article.includes(:categories).find_by(slug: params[:slug]) # truy van dung roi .map
 # B1: find all cate by this art
    @catebynews = Category.where(id: @news.article_categories.map{|e| e.category_id})
  #B2: fina all cate by each cate ( cuz n-n realate)
    @relatenew = Article.where( id: @catebynews.map{|i| i.article_ids}, status: :public)
    @allcate = Category.all
    @news1 = Article.where(status: :public).order(created_at: :DESC).limit(2)
    @newcategory = Category.includes(:article_categories).order(created_at: :DESC).limit(6)
    @comment = Comment.where(article_id: @news.id) #tra ve cac binh luan trong bai viet tuong ungws
  end
  ################################# Show the cate also list post by cate
  def showcate
    @cate = Category.includes(:children).where(parent_id: params[nil])  # this for bar.html.erb
    @showcate = Category.find_by(slug: params[:slug]) # tim id cate tuong ung
    @newbycate = @showcate.articles.where(:articles => { :status => "public" } ).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
   # debugger
    @news1 = Article.where(status: "public").order(created_at: :DESC).limit(4)
    @allcate = Category.all
  
    
  end
  def about
  end
  def contact
    @cate = Category.all
  end
  def search
    #tin ten bai viet tuong ung

  end
  def createcommnent
    @comments = Comment.new
    @comments.save
    redirect_to :controller => 'hompage', :action => 'index'
  end
end
