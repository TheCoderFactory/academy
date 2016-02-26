class UpdateSpreadsheetController < ApplicationController


  def update
    UpdateSpreadsheetJob.perform_async
    redirect_to(:back)
  end
end
