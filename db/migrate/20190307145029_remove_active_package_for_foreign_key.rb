class RemoveActivePackageForForeignKey < ActiveRecord::Migration[5.2]
  def change
      remove_foreign_key "users", column: "active_package_id"
  end
end
