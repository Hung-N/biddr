class Auction < ApplicationRecord

  belongs_to :user, optional: true
  has_many :bids, dependent: :destroy

  validates :title, {presence: true}
  validates :description, {length: {minimum: 5, maximum: 1000}}
  validates :reserve, numericality: {greater_than_or_equal_to: 0}

  before_validation :titleize_title

  private

  

  def titleize_title
    self.title = title.titleize if title.present?
  end
end
