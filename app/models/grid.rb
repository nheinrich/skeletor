class Grid < ActiveRecord::Base
  attr_accessible :columns, :width, :gutter_width
  
  belongs_to :project
end
