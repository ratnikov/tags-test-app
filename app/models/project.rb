class Project < ActiveRecord::Base
  has_many :taggables, :as => :parent
  has_many :tags, :through => :taggables
end
