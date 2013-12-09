class LabelsController < ApplicationController
  respond_to :json

  def index
    render json: API::Client.new.labels
  end

  def create
    # Allow multiple types
    response = API::Client.new.create_label(
      "name"=> params["name"],
      "description"=> params["description"],
      "enabled"=> params["enabled"],
      "color"=> params["color"],
      "types"=> [params["type"]],
    )

    if response.length == 0
      head :bad_request
    else
      render json: response[0]
    end
  end
end
