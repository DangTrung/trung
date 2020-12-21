class Admin::ArticleController < Admin::BaseController
    before_action :logged_in?
    load_and_authorize_resource :except => [:index]
    before_action :load_permissions

    def index
        @category = Category.all
        @article = Article.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
        filter    
    end

    def searchbytitle
         
        if params[:search]
            @category = Category.all
            @article = Article.where(title: params[:search]).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
           
        else
            redirect_to action: 'index'
        end
    end
    #create the post
    def new
        
        @article = Article.new
        @category = Category.all
    end

    def create 
       
        @category = Category.all    
        @article = Article.new(article_params)
        if @article.save
            params[:article][:category_ids].each do |i|
                if !i.blank?
                    @article.article_categories.create(:category_id => i)  #cap nhap bang phu nhieu nhieu
                end
            end
   #         @article.article_categories.create(category_id: params[:article][:category_ids[]])
            flash[:success] = "Article Create"
            redirect_to action: 'index'
           # redirect_to :controller => 'article', :action => 'index'
        else
           # redirect_to controller: :article, action: :new
           @selected = params[:article][:category_ids]
           render 'new'
        end

    end
    #update the post
    def edit
        @category = Category.all
        @article = Article.find_by(id: params[:id])
        @selected = @article.categories.pluck(:id) # tra ve category da chon, Ko dùng đc :selected => params, khác bên index
     #  debugger
    end
    def update
        @all = Category.all
        @article = Article.find_by(id: params[:id])
        if @article.update(attributes: article_params, category_ids: params['article']['category_ids'])
            flash[:success] = "Article Updated"
            redirect_to  :action => 'index'
        else
            flash[:danger] = "Unsuccessfully Update"
            @selected = params[:article][:category_ids]
            render action: 'edit'  
        end
        
    end
    def updatestatus
        @article = Article.find_by(id: params[:id])
        case @current_user.role.role_name
        when "admin"
            @article.update_columns(:status => params[:status])
        else
            @article.update_columns(:status => "pending")
        end
    
        redirect_to :controller => 'article', :action => 'index'

    end
    #destroy the post
    def destroy
        Article.find_by(id: params[:id]).destroy
        flash[:success] = "Article deleted"
        @article = Article.all
        redirect_to action: 'index'
    end

    private
    def article_params
        params.require(:article).permit(:title, :content, :short_description, :image_url, :slug)
    end
    def filter 
        c = params[:searchcate].blank?
        d = params[:day1].blank? || params[:day2].blank?
        s = params[:status].blank?
        
        if !c
            @cate= Category.find_by(name: params[:searchcate])
            if !d && !s
                @article = @cate.articles.where(:articles => { created_at: params[:day1]..params[:day2], status: params[:status]}).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
            elsif !d && s
                @article = @cate.articles.where(:articles => { created_at: params[:day1]..params[:day2]}).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
            elsif !s && d 
                @article = @cate.articles.where(:articles => { status: params[:status] }).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
            else
                @article = @cate.articles.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
            end
        elsif c
            if !d && !s
                @article = Article.where(created_at: params[:day1]..params[:day2], status: params[:status]).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
            elsif !d && s
                @article = Article.where(created_at: params[:day1]..params[:day2]).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
            elsif d && !s 
                @article = Article.where( status: params[:status]).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
            end
        else
            @article = Article.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
        end
       
    end
    
end
