class Product < ActiveRecord::Base
  # this uses the ImageUploader class to upload an image for this model
  # we must have a field called "image" for this model
  # mount_uploader :image, ImageUploader
  # has_many :attachments, dependent: :destroy
  # accepts_nested_attributes_for :attachments, allow_destroy:true, reject_if: lambda {|x| !x[:image].present?}
  #
  # extend FriendlyId
  # friendly_id :title, use: [:slugged,:history]
  #
  # has_many :avaters, as: :imageable
  # mount_uploader :avatar, AvatarUploader
  # has_many :avatars, dependent: :destroy
  # accepts_nested_attributes_for :avatars, allow_destroy:true, reject_if: lambda {|x| !x[:avatar].present?}

  # include adds module methods as instance methods
  # extend adds module methods as class methods
  # extend FriendlyId
  # friendly_id :title, use: [:slugged,:history]

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy:true ,reject_if: lambda {|x| !x[:image].present?}


  belongs_to :category
  belongs_to :producer

  has_many :favourites, dependent: :destroy
  has_many :favouriting_users, through: :favourites, source: :user

  has_many :reviews, dependent: :destroy
  has_many :reviewing_users, through: :reviews, source: :user

  validates :title, presence: {message: "must be provided"},
                    uniqueness: true,
                    length: {minimum: 5}

  validates :price, numericality: {greater_than_or_equal_to: 0}

  # this validates the uniqueness of title/body combination
  # validates(:body, {:uniqueness => {:scope => :title}})
  validates :description, uniqueness: {scope: :title}

  has_one :paynow


  # after_initialize :set_defaults
  before_validation :capitalize
  # include AASM
  #     aasm do
  #       state :published, initial: true
  #       # state :pay_now
  #       state :in_cart
  #       state :canceled
  #       state :paynow_met
  #       state :already_pay
  #       state :payment_met
  #       state :draft
  #       state :good_price
  #
  #       event :instant_pay do
  #         transitions from: :published, to: :paynow_met
  #       end
  #
  #       event :sold_out do
  #         transitions from: :paynow_met, to: :already_pay
  #       end
  #
  #       event :canceld do
  #           transitions from: :paynow_met,to: :published
  #       end
      # end

  # Method that takes a single argument and returns all the products whose
  # title or price include the argument passed. It should be find all the records
  # regardless of the case
  def self.search(term)
    where(["price ILIKE ? OR title ILIKE ?", "%#{term}%", "%#{term}%"])
  end

  def favourited_by?(user)
    favourites.where(user: user).present?
  end

  def favourite_for(user)
    favourites.find_by_user_id(user)
  end

  def find_same_product(category)
    # Product.find_by_category_id(category)
    Product.where(category_id: category)

  end


  def reviewed_by?(user)
    reviews.where(user: user).present?
  end

  def review_for(user)
    reviews.find_by_user_id(user)
  end

  private
  def capitalize
    # self.title = self.title.capitalize
    self.title.capitalize!
  end
end
