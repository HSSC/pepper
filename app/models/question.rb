class Question < ActiveRecord::Base
  serialize :dimensions

  validates :dimensions, presence: true
end
