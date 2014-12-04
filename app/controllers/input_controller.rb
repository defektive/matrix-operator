class InputController < ApplicationController
  # GET /outputs
  # GET /outputs.json

  def initialize ()
    super

    @inputs = [
      {
        id: 1,
        name: 'Cameras'
      },
      {
        id: 2,
        name: 'XBOX'
      },
      {
        id: 3,
        name: 'PS3'
      },
      {
        id: 4,
        name: 'Raspberry Pi'
      }
    ]
  end


  def index
    render json: @inputs
  end

  # GET /outputs/1
  # GET /outputs/1.json
  def view
    render json: {id: params[:name]}
  end

  # PATCH/PUT /outputs/1
  # PATCH/PUT /outputs/1.json
  def update
    m = MonoMatrix.new "/dev/ttyAMA0"
    m.switch params[:name], channel_params[:input].to_i
    head :no_content
  end

  private
    def channel_params
      params.require(:channel).permit(:input)
    end
end
