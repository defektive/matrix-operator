class ChannelController < ApplicationController
  # GET /outputs
  # GET /outputs.json

  def initialize ()
    super

    @channels = [
      {
        channel: "A",
        name: 'Living Room'
      },
      {
        channel: "B",
        name: 'Master Bedroom'
      }
    ]
  end

  def index
    render json: @channels
  end

  # GET /outputs/1
  # GET /outputs/1.json
  def view
    render json: {id: params[:name]}
  end

  # PATCH/PUT /outputs/1
  # PATCH/PUT /outputs/1.json
  def update
    m = MonoMatrix::Switcher.new "/dev/ttyAMA0"
    m.switch params[:name], channel_params[:input].to_i
    head :no_content
  end

  private
    def channel_params
      params.require(:channel).permit(:input)
    end
end
