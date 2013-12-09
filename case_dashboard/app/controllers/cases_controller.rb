class CasesController < ApplicationController
  respond_to :json

  def index
    render json: API::Client.new.cases
  end

  def update
    # Assumes the only update is adding a new label and that the label will be appended (default API behavior)
    API::Client.new.add_label_to_case params[:label]
  end
end
