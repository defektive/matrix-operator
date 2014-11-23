class OutputsController < ApplicationController
  # GET /outputs
  # GET /outputs.json
  def index
    @outputs = Output.all

    render json: @outputs
  end

  # GET /outputs/1
  # GET /outputs/1.json
  def show
    @output = Output.find(params[:id])

    render json: @output
  end

  # POST /outputs
  # POST /outputs.json
  def create
    @output = Output.new(output_params)

    if @output.save
      render json: @output, status: :created, location: @output
    else
      render json: @output.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /outputs/1
  # PATCH/PUT /outputs/1.json
  def update
    @output = Output.find(params[:id])

    if @output.update(output_params)
      head :no_content
    else
      render json: @output.errors, status: :unprocessable_entity
    end
  end

  # DELETE /outputs/1
  # DELETE /outputs/1.json
  def destroy
    @output = Output.find(params[:id])
    @output.destroy

    head :no_content
  end

  private
    
    def output_params
      params.require(:output).permit(:name, :output, :input)
    end
end
