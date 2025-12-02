class AddDefaultToPublishersIsDeleted < ActiveRecord::Migration[8.1]
  def change
    change_column_default :publishers, :is_deleted, from: nil, to: false
    change_column_null :publishers, :is_deleted, false
  end
end
  