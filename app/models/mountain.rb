class Mountain < ActiveRecord::Base
  NORTHEAST = [
      ["Massachusetts", "MA"],
      ["New Hampshire", "NH"],
      ["Vermont", "VT"],
      ["Maine", "ME"],
      ["New York", "NY"],
      ["Pennsylvania", "PA"]
    ]

  validates :name, presence: true
  validates :city_or_town, presence: true
  validates :state,
  presence: true,
  inclusion: { in: NORTHEAST.map { |state| state[1] } }
  validates :zip, presence: true
  validates :description, presence: true

  has_many :reviews
  has_many :users, through: :reviews
end
