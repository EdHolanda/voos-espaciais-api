class CreateLaunches < ActiveRecord::Migration[6.1]
  def change
    create_table :launches do |t|
      t.references :article, null: false, foreign_key: true
      t.string :provider

      t.timestamps
    end
  end
end
