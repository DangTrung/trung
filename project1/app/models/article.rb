class Article < ApplicationRecord
    before_create {self.slug = slug.downcase}
    before_update {self.slug = slug.downcase}
    before_save :default_values
    
    validates :title, presence: true, uniqueness: true
    validates :slug, presence: true, uniqueness: true
  #  validates :image_url, allow_blank: true
  # error             format: { with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.'}
    validates :short_description, presence: true
    validates :content, presence: true

    mount_uploader :image_url, PictureUploader
  
    has_many :article_categories, foreign_key: 'article_id', dependent: :destroy
    has_many :categories, through: :article_categories
    has_many :comments
    
    def default_values
      self.status ||= 'draft'
    end
      
end
