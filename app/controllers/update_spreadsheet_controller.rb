class UpdateSpreadsheetController < ApplicationController
  before_action :authenticate_user! , only: [:update, :course_intake]

  def update
    UpdateSpreadsheetJob.perform_async
    redirect_to(:back)
  end
end
