require 'test_helper'

class GenresTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  setup do
    @genre1 = genres(:one)
    @genre2 = genres(:two)
    @product1 = products(:one)
    @product2 = products(:two)
    @product3 = products(:three)
  end

  test "genre list" do
    visit genres_path
    assert page.has_content? @genre1.name
    assert page.has_content? @genre2.name
  end


  test "products listed by genre" do
    #check products for genre 1
    visit genre_path(@genre1)
    assert page.has_content? "Genre:"
    assert page.has_content? @genre1.name
    assert page.has_content? @product1.title
    assert page.has_no_content? @product2.title
    assert page.has_no_content? @product3.title

    #go back to genre list
    click_link('Back')
    assert page.has_content? @genre1.name
    assert page.has_content? @genre2.name

    #check products for genre 2
    visit genre_path(@genre2)
    assert page.has_content? "Genre:"
    assert page.has_content? @genre2.name
    assert page.has_content? @product2.title
    assert page.has_content? @product3.title
    assert page.has_no_content? @product1.title

    click_link('Destroy', match: :first)
    assert page.has_content? @product2.title
    assert page.has_no_content? @product3.title

  end
end
