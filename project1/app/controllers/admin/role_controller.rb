class Admin::RoleController < Admin::BaseController   
    before_action :logged_in?
    load_and_authorize_resource :except => [:index]
    before_action :load_permissions
    def index
        @role = Role.all
    end
    def new
        @role = Role.new
        @name = Permission.pluck(:subject_class).uniq
    end
    def create
        @role = Role.new(role_params)
        @name = Permission.pluck(:subject_class).uniq
        permission_ids = @name.map{ |i| params[i][:permission_ids]}.flatten.uniq   
        if @role.save
                permission_ids.each do |i|
                if !i.blank?
                    @role.permission_roles.create(:permission_id => i)
                end
        end
            flash[:success] = "Created Role Successfully "
            redirect_to action: 'index'
        else
            
            render'new'
        end

    end
    def edit
        @role = Role.find_by(id: params[:id])
        @name = Permission.pluck(:subject_class).uniq

    end
    def update
        @role = Role.find_by(id: params[:id])
        @name = Permission.pluck(:subject_class).uniq
        permission_ids = @name.map{ |i| params[i][:permission_ids]}.flatten.uniq
   
        if @role.update(attributes: role_params, permission_ids: permission_ids)
            flash[:success] = "Updated"
            redirect_to action: 'index'
        else
            render 'edit'
        end
    end
    def destroy
        Role.find_by(id: params[:id]).destroy
        flash[:success] = "Role deleted"
        redirect_to action: 'index'
    end
    private
    def role_params
        params.require(:role).permit(:role_name)
    end
end
