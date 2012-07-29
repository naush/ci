class Song < ActiveRecord::Base
  attr_accessible :title
  attr_accessible :author
  attr_accessible :words

  has_many :charts
end
