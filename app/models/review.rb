class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :body, presence: true
  # has_many :avaters, as: :imageable
  mount_uploader :image, ImageUploader
  # has_many :attachents, dependent: :destroy
  # accepts_nested_attributes_for :attachents, allow_destroy:true, reject_if: lambda {|x| !x[:avatar].present?}
end
