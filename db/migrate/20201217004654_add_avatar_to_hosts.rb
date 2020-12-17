class AddAvatarToHosts < ActiveRecord::Migration[6.1]
  def change
    add_column :hosts, :avatar, :string
  end
end
