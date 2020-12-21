class Role < ApplicationRecord
    before_save { self.role_name = role_name.downcase }
    validates :role_name, presence: true, uniqueness: true
    has_many :users
    has_many :permission_roles, dependent: :destroy
    has_many :permissions, through: :permission_roles
end
