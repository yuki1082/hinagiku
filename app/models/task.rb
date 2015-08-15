class Task < ActiveRecord::Base
  attr_accessible :description, :done, :due_date, :name
  scope :done, where(done: true).order("due_date DESC")
  scope :undone, where(done: false).order("due_date")
  scope :search, lambda { |q|
  	where(["name LIKE ?", "%#{q}%"])
  }

  validates :name, presence: true, length: {maximum: 20}
  validates :description, length:{maximum: 200}
end

