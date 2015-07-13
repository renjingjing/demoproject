class Producer < ActiveRecord::Base
  belongs_to :category
  has_many :products, dependent: :destroy
  # has_many :avaters, as: :imageable
  # mount_uploader :avatar, AvatarUploader
  # has_many :avatars, dependent: :destroy
  # accepts_nested_attributes_for :avaters, allow_destroy:true, reject_if: lambda {|x| !x[:avatar].present?}

end
