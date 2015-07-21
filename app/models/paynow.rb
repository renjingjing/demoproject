class Paynow < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :amount, presence: true, numericality: {greater_than: 0}
  # validates :product, uniqueness: true

  include AASM

 aasm whiny_transitions: false do
   state :instore, initial: true
   state :completed
   state :cancelled
   state :refunded

   event :payed do
     transitions from: :instore, to: :completed
   end

   event :cancel do
     transitions from: [:payingnow, :completed], to: :cancelled
   end

   event :refund do
     transitions from: :completed, to: :refunded
   end
 end


end
