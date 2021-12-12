class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.bigint :id_orig
      t.string :title
      t.string :url
      t.string :imageUrl
      t.string :newsSite
      t.string :summary
      t.boolean :featured
      t.string :publishedAt
      t.string :updatedAt
      t.timestamps
    end
  end
end
