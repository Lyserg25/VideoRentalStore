require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "category name" do
    categoryName1 = 'category1'
    categoryName2 = 'category2'
    category = Category.new(name: categoryName1)
    assert_equal(categoryName1, category.name)

    category.name = categoryName2
    assert_equal(categoryName2, category.name)
  end

end
