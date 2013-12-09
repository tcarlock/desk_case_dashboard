class LabelsController < ApplicationController
  respond_to :json

  def index
    render json: API::Client.new.labels
  end

  def create

  end
end
