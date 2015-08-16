class ChangeDefaultValueForStatus < ActiveRecord::Migration
  def change
    remove_column :todos, :status
    add_column :todos, :status, :boolean, default: false
  end
end
