class ApplicationController < ActionController::Base
  
  protected
 
    #derive the model name from the controller. egs UsersController will return User
    def self.permission
      return subject_class = self.name.gsub('Controller','').singularize.split('::').last.constantize.name rescue nil
    end
   
    def current_ability
      @current_ability = Ability.new(current_user)
    end
   
    #load the permissions for the current user so that UI can be manipulated
    def load_permissions
     
      @current_permissions = current_user.role.permissions.collect{|i| [i.subject_class, i.action]}
    end

   
   
end
