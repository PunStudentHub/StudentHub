class DefaultCompleteFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_null :taskees, :completed, false, 0
  end
end
