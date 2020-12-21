class CreatePermissionRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :permission_roles do |t|
      t.integer :permission_id
      t.integer :role_id

      t.timestamps
    end
  end
end
