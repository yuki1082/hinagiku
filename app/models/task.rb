class Task < ActiveRecord::Base
  attr_accessible :description, :done, :due_date, :name
  scope :done, where(done: true).order("due_date DESC")
  scope :undone, where(done: false).order("due_date")
  scope :search, lambda { |q|
  	where(["name LIKE ?", "%#{q}%"])
  }
end

