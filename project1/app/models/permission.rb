class Permission < ApplicationRecord
    has_many :permission_roles, foreign_key: 'permission_id', dependent: :destroy
    has_many :roles, through: :permission_roles


end
