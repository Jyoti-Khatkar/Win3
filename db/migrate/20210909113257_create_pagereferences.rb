class CreatePagereferences < ActiveRecord::Migration[6.1]
  def change
    create_table :pagereferences do |t|

      t.timestamps
    end
  end
end
