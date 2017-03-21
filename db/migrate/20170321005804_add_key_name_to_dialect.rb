class AddKeyNameToDialect < ActiveRecord::Migration[5.0]
  def change
    add_column :dialects, :key_name, :string
  end
end
