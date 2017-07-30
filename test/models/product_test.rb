require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  setup do
    @genre1 = genres(:one)
    @genre2 = genres(:two)
    @category1 = categories(:one)
    @category2 = categories(:two)
    @product1 = products(:one)
    @product2 = products(:two)
  end

  test "product attributes" do
    title1 = 'title1'
    title2 = 'title2'
    description1 = 'description1'
    description2 = 'description2'
    amount1 = 1
    amount2 = 2
    product = Product.new(title: title1, description: description1, genre_id: @genre1.id, amount: amount1, category_id: @category1.id)
    assert_equal(title1, product.title)
    assert_equal(description1, product.description)
    assert_equal(amount1, product.amount)
    assert_equal(@category1, product.category)
    assert_equal(@genre1, product.genre)

    product.title = title2
    assert_equal(title2, product.title)

    product.description = description2
    assert_equal(description2, product.description)

    product.amount = amount2
    assert_equal(amount2, product.amount)

    product.category = @category2
    assert_equal(@category2, product.category)

    product.genre = @genre2
    assert_equal(@genre2, product.genre)
  end

  test "category association" do
    categoryName = "category2"
    assert_equal(@category1, @product1.category)
    assert_equal(@category1.name, @product1.category.name)
    assert_not_equal(categoryName, @category1.name)

    @category1.name = categoryName
    @product1.category = @category1
    assert_equal(@category1.name, @product1.category.name)
    assert_equal(categoryName, @product1.category.name)

    @product1.category = @product2.category
    assert_equal(@product2.category.name, @product1.category.name)

  end

  test "genre association" do
    genreName = "genre2"
    assert_equal(@genre1, @product1.genre)
    assert_equal(@genre1.name, @product1.genre.name)
    assert_not_equal(genreName, @genre1.name)

    @genre1.name = genreName
    @product1.genre = @genre1
    assert_equal(@genre1.name, @product1.genre.name)
    assert_equal(genreName, @product1.genre.name)

    @product1.genre = @product2.genre
    assert_equal(@product2.genre.name, @product1.genre.name)
  end

end
