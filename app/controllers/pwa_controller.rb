class PwaController < ApplicationController
  protect_from_forgery except: :service_worker
  
  def service_worker
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def manifest
    render json: {
      name: "Your App Name",
      short_name: "App",
      start_url: "/",
      display: "standalone",
      background_color: "#FFFFFF",
      theme_color: "#000000",
      icons: []
    }
  end
end 