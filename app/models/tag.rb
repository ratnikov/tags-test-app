class Tag < ActiveRecord::Base
  has_many :taggables

  has_many :posts, :through => :taggables, :source => :parent, :source_type => 'Post'
  has_many :projects, :through => :taggables, :source => :parent, :source_type => 'Project'

  def records(*args)
    taggables(*args).map &:parent
  end
end
