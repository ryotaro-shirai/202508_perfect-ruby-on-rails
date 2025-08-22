class AddStatusToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :sales_status, :integer
  end
end
