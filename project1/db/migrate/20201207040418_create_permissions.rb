class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.string :action
      t.string :subject_class
      t.string :name
      t.timestamps
    end
  end
end
