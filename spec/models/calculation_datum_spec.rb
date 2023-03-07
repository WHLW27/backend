require 'rails_helper'

RSpec.describe CalculationDatum, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:calculation) }
  end

  describe 'associations' do
    it { should belong_to(:calculation) }
  end
  describe'scopes' do
    describe '.for_calculation' do
      let!(:calculation) { create(:calculation) }
      let!(:calculation_data) { create_list(:calculation_datum, 2, calculation: calculation) }
      let!(:other_calculation_data) { create_list(:calculation_datum, 2) }

      it 'returns calculation data for a given calculation' do
        expect(CalculationDatum.for_calculation(calculation)).to match_array(calculation_data)
      end
    end
end
