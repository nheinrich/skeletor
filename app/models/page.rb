class Page < ActiveRecord::Base
  attr_accessible :name, :markup, :styles
  
  belongs_to :project
end
