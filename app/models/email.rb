class Email < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address
  validates :address, presence: true, uniqueness: {case_senstive: false}
  before_create do
    self.verification_token = SecureRandom.hex
  end

end
