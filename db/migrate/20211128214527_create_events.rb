class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :article, null: false, foreign_key: true
      t.string :provider

      t.timestamps
    end
  end
end
