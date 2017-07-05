class AddGenreIdToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :genre, foreign_key: true
  end
end
