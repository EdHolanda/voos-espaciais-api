class ChangeTypeOfColumnSummary < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :summary, :text
  end
end
