require 'test_helper'

class GenreTest < ActiveSupport::TestCase

  test "genre name" do
    genreName1 = 'genre1'
    genreName2 = 'genre2'
    genre = Genre.new(name: genreName1)
    assert_equal(genreName1, genre.name)

    genre.name = genreName2
    assert_equal(genreName2, genre.name)
  end

end
