class AddFieldsToCalculations < ActiveRecord::Migration[7.0]
  def change
    add_column :calculations, :investAmount, :decimal
    add_column :calculations, :investPeriod, :integer
    add_column :calculations, :growthPercentage, :decimal
  end
end
