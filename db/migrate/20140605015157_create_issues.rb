class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :description
      t.string :status
      t.text :resolution
      t.references :thermostat, index: true

      t.timestamps
    end
  end
end
