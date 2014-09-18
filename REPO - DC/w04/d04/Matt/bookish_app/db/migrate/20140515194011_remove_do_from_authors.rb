class RemoveDoFromAuthors < ActiveRecord::Migration
  def update
    t.date :dob
  end
end
