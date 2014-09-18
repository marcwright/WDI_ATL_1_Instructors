class AddOriginalCssToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :original_css, :string
  end
end
