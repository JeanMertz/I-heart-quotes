class CreateCustomQuotesQuotes < ActiveRecord::Migration
  def change
    create_table :custom_quotes_quotes do |t|
      t.string :quote_text, null: false
      t.string :author

      t.timestamps
    end
  end
end
