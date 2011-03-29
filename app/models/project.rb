class Project < ActiveRecord::Base
  attr_accessible :name, :overview, :announcement, :status
  
  has_one :grid, :dependent => :destroy
  has_many :layouts, :dependent => :destroy
  has_many :libraries
  has_many :pages, :dependent => :destroy
end
