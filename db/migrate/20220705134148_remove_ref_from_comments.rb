class RemoveRefFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :user
  end
end
