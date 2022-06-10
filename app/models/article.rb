class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    belongs_to :user
    include PgSearch
    pg_search_scope :search, against: [:title]
    mount_uploader :image, ImageUploader
end
