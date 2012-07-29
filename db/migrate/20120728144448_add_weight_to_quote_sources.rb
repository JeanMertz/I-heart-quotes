class AddWeightToQuoteSources < ActiveRecord::Migration
  def change
    add_column :quote_sources, :weight, :integer, default: 1
  end
end
