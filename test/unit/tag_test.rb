require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test 'assigning tags to posts and projects' do
    post = Post.create! :body => 'hello world'
    project = Project.create! :name => 'awesome project'

    awesome = Tag.create! :name => 'awesome'
    badass = Tag.create! :name => 'badass'

    Taggable.create! :tag => awesome, :parent => post
    Taggable.create! :tag => awesome, :parent => project

    Taggable.create! :tag => badass, :parent => post

    assert_equal [ post, project ], awesome.records(true)
    assert_equal [ post ], badass.records(true)

    assert_equal [ awesome, badass ], post.tags
    assert_equal [ awesome ], project.tags
  end
end
