class AddNullFalseToApiUrl < ActiveRecord::Migration
  def up
    change_column :quote_sources, :api_url, :text, null: false
  end

  def down
    change_column :quote_sources, :api_url, :text, null: true
  end
end
