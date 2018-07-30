class AddColumnsToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :avatar, :string
    add_column :admins, :is_default, :boolean, default: false
    add_column :admins, :name, :string
    add_column :admins, :permission_level, :integer, default: 0
  end
end
