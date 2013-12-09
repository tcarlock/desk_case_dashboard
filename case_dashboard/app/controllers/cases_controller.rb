class CasesController < ApplicationController
  respond_to :json

  def index
    render json: API::Client.new.cases
  end

  def update
    # Assumes the only update is adding a new label and that the label will be appended (default API behavior)
    if API::Client.new.add_label_to_case params[:id], params[:label_id]
      head :ok
    else
      head :bad_request
    end
  end
end
