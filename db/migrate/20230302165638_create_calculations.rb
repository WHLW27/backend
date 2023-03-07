class CreateCalculations < ActiveRecord::Migration[7.0]
  def change
    create_table :calculations do |t|
      t.decimal :year0
      t.decimal :year1
      t.decimal :year2
      t.decimal :year3
      t.decimal :year4
      t.decimal :year5

      t.timestamps
    end
  end
end
