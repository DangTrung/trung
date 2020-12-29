class Admin::CategoryController < Admin::BaseController
    before_action :logged_in?
    load_and_authorize_resource
    before_action :load_permissions
    def index
        @category = Category.all.includes(:parent)
    end
    def new
            @category = Category.new
            @parent = Category.all
    end
    def create
        @parent = Category.all
        @category = Category.new(category_params)
        if @category.save
            redirect_to :controller => 'category', :action => 'index'
        else
            render 'new'
        end
    end
    def edit    
            @category = Category.find_by(id: params[:id])
            @parentbycate = Category.where(id: @category.parent_id).pluck(:id)
            @parent = Category.where.not(id: @category.children.ids, id: params[:id]) # trả về ds các parent không phải con nó ;)    
    end

    def update
        @category = Category.find_by(id: params[:id])
        if @category.update(category_params)
            redirect_to :controller => 'category', :action => 'index'
        else
            @parent = Category.where.not(id: @category.children.ids, id: params[:id])
            @parentbycate = params[:category][:parent_id]
            render 'edit'
            
        end
    end

    def destroy  
            Category.find_by(id: params[:id]).destroy
            flash[:success] = "Deleted"
            @cate = Category.all.includes(:parent)
            redirect_to :controller => 'category', :action => 'index'  
    end
    
    private
    def category_params
        params.require(:category).permit(:name, :parent_id, :slug)
    end
  
end
