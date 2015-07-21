class User < ActiveRecord::Base
  # this is a method from Rails that will give us handy methods to hash
  # the password and compare the password as well.
  # it includes validations for password presence and password matching if
  # password_confirmation is provided
  # http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
  has_secure_password
  mount_uploader :image, ImageUploader
  # before_create :generate_api_key

  # mount_uploader :avatar, ImageUploader
  # has_many :avaters, as: :imageable
  # mount_uploader :avatar, AvatarUploader
  # has_many :avatars, dependent: :destroy
  # accepts_nested_attributes_for :avatars, allow_destroy:true, reject_if: lambda {|x| !x[:avatar].present?}

  # this association is for products that have been created by the user
  # has_many :comments,  dependent: :destroy

  # In this case we need to use has_many / through with a `source` option
  # because we already havea `has_many :questions` association above which will
  # conflict with this association if we just make it
  # `has_many :question, though: :likes`
  # has_many(:liked_questions, {through: :likes, source: :question})
  has_many :favourites, dependent: :destroy
  has_many :favourited_products, through: :favourites, source: :product
  has_many :reviews, dependent: :destroy
  has_many :reviewed_products, through: :reviews, source: :product

  # the object that starts and ends with / is called a regular expression
  # Regular expressions are used to match string patterns
  validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".strip.squeeze(" ")
  end

  # private
  # def generate_api_key
  #   begin
  #     self.api_key = SecureRandom.hex
  #   end while User.exists?(api_key: self.api_key)
  # end
end
