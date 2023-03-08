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
    context "with valid params" do
      let(:valid_params) do
        {
          "investAmount":10000,
          "growthPercentage":3,
          "investPeriod":5,
          "annualContribution":0,
          "monthlyContribution":0
        }
      end

      it 'responds with correctly calculated yearly returns' do
        expect { post :create, params: valid_params, as: :json}.to change(CalculationDatum, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.inspect) == '{10000, 10300, 10609, 10927.27, 11255.09, 11592.74}'
      end

    end

  end

  describe 'POST #create' do
    context "with valid params" do
      let(:valid_params) do
        {
          "investAmount":250,
          "growthPercentage":5,
          "investPeriod":12,
          "annualContribution":0,
          "monthlyContribution":0
        }
      end

      it 'responds with correctly calculated yearly returns' do
        expect { post :create, params: valid_params, as: :json}.to change(CalculationDatum, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.inspect) == '{250, 262.5, 275.63, 289.41, 303.88, 319.07, 335.02, 351.78, 369.36, 387.83, 407.22, 427.58, 448.96}'
      end

    end

  end

  describe 'POST #create' do
    context "with valid params" do
      let(:valid_params) do
        {
          "investAmount":500000,
          "growthPercentage":8,
          "investPeriod":6,
          "annualContribution":0,
          "monthlyContribution":0
        }
      end

      it 'responds with correctly calculated yearly returns' do
        expect { post :create, params: valid_params, as: :json}.to change(CalculationDatum, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.inspect) == '{500000, 540000.0, 583200.0, 629856.0, 680244.48, 734664.04, 793437.16}'
      end

    end

  end

  describe 'POST #create' do
    context "with valid params" do
      let(:valid_params) do
        {
          "investAmount":23456,
          "growthPercentage":3,
          "investPeriod":9,
          "annualContribution":0,
          "monthlyContribution":0
        }
      end

      it 'responds with correctly calculated yearly returns' do
        expect { post :create, params: valid_params, as: :json}.to change(CalculationDatum, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.inspect) == '{23456, 24159.68, 24884.47, 25631.0, 26399.93, 27191.93, 28007.69, 28847.92, 29713.36, 30604.76}'
      end

    end

  end

  describe 'POST #create' do
    context "with valid params" do
      let(:valid_params) do
        {
          "investAmount":100000,
          "growthPercentage":8,
          "investPeriod":12,
          "annualContribution":0,
          "monthlyContribution":0
        }
      end

      it 'responds with correctly calculated yearly returns' do
        expect { post :create, params: valid_params, as: :json}.to change(CalculationDatum, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.inspect) == '{100000, 108000.0, 116640.0, 125971.2, 136048.9, 146932.81, 158687.43, 171382.43, 185093.02, 199900.46, 215892.5, 233163.9, 251817.01}'
      end

    end

  end

  describe 'POST #create' do
    context "with valid params" do
      let(:valid_params) do
        {
          "investAmount":1,
          "growthPercentage":3,
          "investPeriod":25,
          "annualContribution":0,
          "monthlyContribution":0
        }
      end

      it 'responds with correctly calculated yearly returns' do
        expect { post :create, params: valid_params, as: :json}.to change(CalculationDatum, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.inspect) == '{1, 1.03, 1.06, 1.09, 1.13, 1.16, 1.19, 1.23, 1.27, 1.3, 1.34, 1.38, 1.43, 1.47, 1.51, 1.56, 1.6, 1.65, 1.7, 1.75, 1.81, 1.86, 1.92, 1.97, 2.03, 2.09}'
      end

    end

  end

  describe 'POST #create' do
    context "with valid params" do
      let(:valid_params) do
        {
          "investAmount":500,
          "growthPercentage":3,
          "investPeriod":19,
          "annualContribution":0,
          "monthlyContribution":0
        }
      end

      it 'responds with correctly calculated yearly returns' do
        expect { post :create, params: valid_params, as: :json}.to change(CalculationDatum, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.inspect) == '{500, 515.0, 530.45, 546.36, 562.75, 579.64, 597.03, 614.94, 633.39, 652.39, 671.96, 692.12, 712.88, 734.27, 756.29, 778.98, 802.35, 826.42, 851.22, 876.75}'
      end

    end

  end

  describe 'POST #create' do
    context "with valid params" do
      let(:valid_params) do
        {
          "investAmount":10000,
          "growthPercentage":8,
          "investPeriod":20,
          "annualContribution":0,
          "monthlyContribution":0
        }
      end

      it 'responds with correctly calculated yearly returns' do
        expect { post :create, params: valid_params, as: :json}.to change(CalculationDatum, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.inspect) == '{10000, 10800.0, 11664.0, 12597.12, 13604.89, 14693.28, 15868.74, 17138.24, 18509.3, 19990.05, 21589.25, 23316.39, 25181.7, 27196.24, 29371.94, 31721.69, 34259.43, 37000.18, 39960.19, 43157.01, 46609.57}'
      end

    end

  end

  describe 'POST #create' do
    context "with valid params" do
      let(:valid_params) do
        {
          "investAmount":450,
          "growthPercentage":3,
          "investPeriod":22,
          "annualContribution":0,
          "monthlyContribution":0
        }
      end

      it 'responds with correctly calculated yearly returns' do
        expect { post :create, params: valid_params, as: :json}.to change(CalculationDatum, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.inspect) == '{450, 463.5, 477.41, 491.73, 506.48, 521.67, 537.32, 553.44, 570.05, 587.15, 604.76, 622.91, 641.59, 660.84, 680.67, 701.09, 722.12, 743.78, 766.09, 789.08, 812.75, 837.13, 862.25}'
      end

    end

  end

  describe 'POST #create' do
    context "with valid params" do
      let(:valid_params) do
        {
          "investAmount":500,
          "growthPercentage":8,
          "investPeriod":21,
          "annualContribution":0,
          "monthlyContribution":0
        }
      end

      it 'responds with correctly calculated yearly returns' do
        expect { post :create, params: valid_params, as: :json}.to change(CalculationDatum, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.inspect) == '{500, 540.0, 583.2, 629.86, 680.24, 734.66, 793.44, 856.91, 925.47, 999.5, 1079.46, 1165.82, 1259.09, 1359.81, 1468.6, 1586.08, 1712.97, 1850.01, 1998.01, 2157.85, 2330.48, 2516.92}'
      end

    end

  end

  describe 'POST #create' do
    context "with valid params" do
      let(:valid_params) do
        {
          "investAmount":24000,
          "growthPercentage":5,
          "investPeriod":5,
          "annualContribution":0,
          "monthlyContribution":0
        }
      end

      it 'responds with correctly calculated yearly returns' do
        expect { post :create, params: valid_params, as: :json}.to change(CalculationDatum, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.inspect) == '{24000, 25200, 26460, 27783, 29175.15, 30630.76}'
      end

    end

  end
end


