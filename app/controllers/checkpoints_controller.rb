class CheckpointsController < ApplicationController
  before_action :set_checkpoint, only: %i[ show update destroy ]

  # GET /checkpoints
  def index
    @checkpoints = Checkpoint.all

    render json: @checkpoints
  end

  # GET /checkpoints/1
  def show
    render json: @checkpoint
  end

  # POST /checkpoints
  def create
    @checkpoint = Checkpoint.new(checkpoint_params)

    if @checkpoint.save
      render json: @checkpoint, status: :created, location: @checkpoint
    else
      render json: @checkpoint.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /checkpoints/1
  def update
    if @checkpoint.update(checkpoint_params)
      render json: @checkpoint
    else
      render json: @checkpoint.errors, status: :unprocessable_entity
    end
  end

  # DELETE /checkpoints/1
  def destroy
    @checkpoint.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkpoint
      @checkpoint = Checkpoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checkpoint_params
      params.fetch(:checkpoint, {})
    end
end
