require 'test_helper'

class CategoriesTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper


  test "categorylist" do
    category1 = categories(:one)
    category2 = categories(:two)

    visit categories_path
    assert page.has_content? category1.name
    assert page.has_content? category2.name
  end


  test "products listed by category" do
    category1 = categories(:one)
    category2 = categories(:two)
    product1 = products(:one)
    product2 = products(:two)
    product3 = products(:three)

    #check products for category1
    visit category_path(category1)
    assert page.has_content? "Category:"
    assert page.has_content? category1.name
    assert page.has_content? product1.title
    assert page.has_no_content? product2.title
    assert page.has_no_content? product3.title

    #go back to categorylist
    click_link('Back')
    assert page.has_content? category1.name
    assert page.has_content? category2.name

    #check products for category2
    visit category_path(category2)
    assert page.has_content? "Category:"
    assert page.has_content? category2.name
    assert page.has_content? product2.title
    assert page.has_content? product3.title
    assert page.has_no_content? product1.title

    click_link('Destroy', match: :first)
    assert page.has_content? product2.title
    assert page.has_no_content? product3.title

  end
end
