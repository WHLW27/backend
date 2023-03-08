class Api::V2::CalculationDataController < ApplicationController
  before_action :set_calculation_datum, only: %i[ show update destroy ]

  # GET /calculation_data
  def index
    # get the last record in the db
    @calculation_data = CalculationDatum.last

    render json: @calculation_data
  end

  # GET /calculation_data/1
  def show
    render json: @calculation_datum
  end

  # POST /calculation_data
  def create
    # create a new record in he db
    @calculation_datum = CalculationDatum.new(calculation_datum_params)

    # get the data from the request
    information = request.raw_post
    data_parsed = JSON.parse(information)

    # assign the data to variables
    invest_amount = data_parsed["investAmount"]
    invest_period = data_parsed["investPeriod"]
    growth_percentage = data_parsed["growthPercentage"]
    annual_contribution = data_parsed["annualContribution"]
    monthly_contribution = data_parsed["monthlyContribution"]

    # create an array to store the data
    return_array = [invest_amount]
    @calculation_datum["year0"] = invest_amount

    # check if the data is nil and return an error if it is
    if invest_amount == nil or invest_period == nil or growth_percentage == nil
      render json: @calculation.errors, status: :unprocessable_entity
    end

    # check if the data contains a monthly contribution and convert it to an annual contribution
    if monthly_contribution > 0
      monthly_contribution = monthly_contribution.to_f * 12
      annual_contribution = monthly_contribution
    end

    # calculate the growth
    calc_percent = growth_percentage.to_f / 100
    calc_growth = invest_amount * (calc_percent + 1)

    # calculate the principal
    principal = invest_amount

    # iterate over the invest period
    i = 0
    until i >= (invest_period)
      # compound interest calculation
      amount = principal * ((1 + calc_percent) ** 1)
      interest = amount - principal
      invest_amount = invest_amount + interest
      principal = invest_amount

      # add the annual contribution if it exists
      if annual_contribution > 0
        invest_amount = invest_amount + annual_contribution
      end

      # add the data to the array
      return_array.push(invest_amount.round(2))

      i = i + 1
    end

    # iterate over the invest period
    i = 0
    until i >= (invest_period)
      # iterate over the new database object, in particular the year values and assign them the values from the array
      @calculation_datum.attributes.drop(6 + i).slice(1, invest_period).each do |attr_name, attr_value|
        # skip the annual and monthly contribution values
        if attr_name == "annualContribution" || attr_name == "monthlyContribution"
          next
        end
        @calculation_datum[attr_name] = return_array[i + 1]
        i = i + 1
      end
    end

    # log the data
    # @calculation_datum.attributes.each do |attr_name, attr_value|
    #   # logger.debug "calculation: #{attr_name}: #{attr_value}"
    # end

    # log the array
    logger.debug "return_array: #{return_array}"

    # if the data is valid, save it to the database and return the array
    if @calculation_datum.save
      render json: return_array
    else
      render json: @calculation_datum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /calculation_data/1
  def update
    if @calculation_datum.update(calculation_datum_params)
      render json: @calculation_datum
    else
      render json: @calculation_datum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /calculation_data/1
  def destroy
    @calculation_datum.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calculation_datum
    @calculation_datum = CalculationDatum.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def calculation_datum_params
    params.require(:calculation_datum).permit(:investAmount, :investPeriod, :growthPercentage, :annualContribution, :monthlyContribution, :year0, :year1, :year2, :year3, :year4, :year5, :year6, :year7, :year8, :year9, :year10, :year11, :year12, :year13, :year14, :year15, :year16, :year17, :year18, :year19, :year20, :year21, :year22, :year23, :year24, :year25, :year26, :year27, :year28, :year29, :year30, :year31, :year32, :year33, :year34, :year35, :year36, :year37, :year38, :year39, :year40, :year41, :year42, :year43, :year44, :year45, :year46, :year47, :year48, :year49, :year50, :year51, :year52, :year53, :year54, :year55, :year56, :year57, :year58, :year59, :year60, :year61, :year62, :year63, :year64, :year65, :year66, :year67, :year68, :year69, :year70, :year71, :year72, :year73, :year74, :year75, :year76, :year77, :year78, :year79, :year80, :year81, :year82, :year83, :year84, :year85, :year86, :year87, :year88, :year89, :year90, :year91, :year92, :year93, :year94, :year95, :year96, :year97, :year98, :year99, :year100)
  end
end
