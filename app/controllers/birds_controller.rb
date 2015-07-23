require 'roar/representer/json'
class BirdsController < ApplicationController
  include Roar::Rails::ControllerAdditions
  respond_to :json

  before_action :set_bird, only: [:show, :edit, :update, :destroy]

  def index
    @birds =  Bird.all


    respond_with @birds
  end

  def show
    if !@bird
      render status: 404, text: "Bird not found" and return
    end
    respond_with @bird, :represet_with => BirdRepresenter
  end

  def new
    @bird = Bird.new
  end

  def edit
  end


  def create
    bird = Bird.new
    BirdRepresenter.new(bird).from_json(request.raw_post)
    bird.save!

    if bird.valid?
      render status: 200, text: "Bird has successfully created" and return
    else
      render status: 400, tett: "Error while creating Bird >> wrong format" and return
    end

    respond_with @bird, :represet_with => BirdRepresenter
  end


  def update
    #not implemented
  end

  def destroy
    if !@bird
      render status: 404, text: "Bird not found" and return
    else
      @bird.destroy
      render status: 200, text: "Bird has successfully been deleted" and return
    end




  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bird
      @bird = Bird.find(params[:id]) rescue nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bird_params
      params.require(:bird).permit(:name, :family, :continents, :visible)
    end
end
