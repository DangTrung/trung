class Category < ApplicationRecord
    before_create {self.slug = name.parameterize}
    before_update {self.slug = name.parameterize}
    # goi call back de tu dong creat hoac update cho slug 
    validates :name, presence: true, uniqueness: true
    has_many :article_categories, dependent: :destroy
    has_many :articles, through: :article_categories
    has_many :children, :class_name => "Category", foreign_key: 'parent_id'
    belongs_to :parent, :class_name => "Category", foreign_key: 'parent_id', :optional => true
end
