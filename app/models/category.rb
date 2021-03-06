require 'nkf'
class Category < ActiveRecord::Base
  attr_accessible :name 
  has_many :tasks, dependent: :nullify
  belongs_to :owner, class_name: "User"
  validates :name, presence: true, length:{maximum: 10}
  validates :name, uniqueness: {scope: :owner_id, case_senstive: false}
  before_validation :normalize_values


  private 
  def normalize_values
  	if name.present?
  		self.name = NKF.nkf("-Wwz", name)
  		name.strip
  	end 
  end 
end
