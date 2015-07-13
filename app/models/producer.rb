class Producer < ActiveRecord::Base
  belongs_to :category
  has_many :products, dependent: :destroy
end
