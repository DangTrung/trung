namespace :create_permissions do
    desc "Create roles, permissions and users"
    task create_base_data: :environment do
      puts "Create roles"
      Role.create! role_name: "admin"
  
      Role.create! role_name: "staff"
  
      puts "Create a universal permission"
  
      puts "Assign super admin the permission to manage all the models and controllers"
      role = Role.find_by_role_name "Super Admin"
      role.permissions << Permission.find(subject_class: 'all', action: "manage")
  
      puts "Create a user and assign the super admin role to him"
      user = User.new name: "New user", email: "foo_bar@gmail.com", password: "foobar", password_confirmation: "foobar"
      user.role = role
      user.save!
  
      User.create name: "Neo", email: "neo@matrix.com", password: "the_one", password_confirmation: "the_one", role: Role.find_by_name("Staff")
    end
end
