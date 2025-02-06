class ServiceWorkersController < ApplicationController
  protect_from_forgery except: :service_worker
  
  def service_worker
    respond_to do |format|
      format.js { render layout: false }
    end
  end
end 