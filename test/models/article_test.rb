require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save article without title" do
  	product = Article.new
  	assert_not product.save, "Saved the article without a title"
  end
end
