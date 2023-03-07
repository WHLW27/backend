class Api::V1::CalculationsController < ApplicationController
  before_action :set_calculation, only: %i[ show update destroy ]

  # GET /calculations
  def index
    @calculations = Calculation.all

    render json: @calculations
  end

  # GET /calculations/1
  def show
    render json: @calculation
  end

  # POST /calculations
  def create
    @calculation = Calculation.new(calculation_params)
    information = request.raw_post
    data_parsed = JSON.parse(information)

    invest_amount = data_parsed["investAmount"]
    invest_period = data_parsed["investPeriod"]
    growth_percentage = data_parsed["growthPercentage"]
    return_array = [invest_amount]

    if invest_amount == nil or invest_period == nil or growth_percentage == nil
      # render json: @calculation.errors, status: :unprocessable_entity
    end

    calc_percent = growth_percentage.to_f / 100
    calc_growth = invest_amount * (calc_percent + 1)

    logger.debug "calcPercent: #{calc_percent}"
    logger.debug "investPeriod: #{invest_period}"
    logger.debug "calcGrowth: #{calc_growth}"

    principal = invest_amount
    logger.debug "principal: #{principal}"
    i = 0

    until i >= (invest_period) do
      logger.debug "all good"
      amount = principal * ((1 + calc_percent) ** 1)
      logger.debug "amount: #{amount}"

      interest = amount - principal
      logger.debug "interest: #{interest}"

      invest_amount = invest_amount + interest
      logger.debug "invest_amount: #{invest_amount}"

      principal = invest_amount
      logger.debug "principal: #{principal}"

      return_array.push(invest_amount.round(2))

      @calculation.attributes.drop(2 + i).each do |attr_name, attr_value|

        @calculation[attr_name] = invest_amount.round(2)
      end
      i = i + 1
    end

    @calculation["year0"]  = 0
    @calculation.attributes.each do |attr_name, attr_value|
      logger.debug "calculation: #{attr_name}: #{attr_value}"
    end
    

    logger.debug "return_array: #{return_array}"
   
    if @calculation.save
      render json: @calculation, status: :created, location: @calculation
    else
      render json: @calculation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /calculations/1
  def update
    if @calculation.update(calculation_params)
      render json: @calculation
    else
      render json: @calculation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /calculations/1
  def destroy
    @calculation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calculation
      @calculation = Calculation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calculation_params
      params.require(:calculation).permit(:investAmount, :growthPercentage, :investPeriod, :year0, :year1, :year2, :year3, :year4, :year5)
    end
end
