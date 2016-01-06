class WomenInTechScholarship < ActiveRecord::Base
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, :format => EMAIL_REGEX
  validates :age, :phone, presence: true
  validates :reason, :career, presence: true
  validates :accepted_terms, presence: true
end
