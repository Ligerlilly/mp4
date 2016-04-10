class AddFileToVideo < ActiveRecord::Migration
  def up
    add_attachment :videos, :file
  end

  def down
    remove_attachment :videos, :file
  end
end
