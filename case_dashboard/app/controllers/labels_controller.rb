class LabelsController < ApplicationController
  respond_to :json

  def index
    render json: API::Client.new.labels
  end

  def create
    binding.pry
    API::Client.new.create_label params[:label]
  end
end
