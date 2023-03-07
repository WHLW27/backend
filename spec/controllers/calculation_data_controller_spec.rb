require 'rails_helper'

RSpec.describe Api::V2::CalculationDataController, type: :controller do
  describe 'GET #index' do
    it 'finds the last record in the db and returns json' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

  end

  describe 'POST #create' do
    before { post :create, params: {"calculation_datum":{"investAmount":24000,"investPeriod":5,"growthPercentage":5,"annualContribution":0,"monthlyContribution":0}}}
    context 'given a valid @calculation_datum with these values: invest_amount = 24000, invest_period = 5, growth_percentage = 5, annual_contribution = 0, monthly_contribution = 0' do
      it 'returns the correct values' do
        @calculation_datum = {
          "investAmount": 24000,
          "investPeriod": 5,
          "growthPercentage": 5,
        }
        expect(response).to have_http_status(:success)
        expect(response.body).to eq("24000,25200,26460,27783,29175.15, 30630.76")
      end
    end
  end
end


