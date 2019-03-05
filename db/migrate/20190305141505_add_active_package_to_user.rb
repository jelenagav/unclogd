class AddActivePackageToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :active_package, foreign_key: { to_table: "packages"}
  end
end
