class HomeController < ApplicationController
  def home_page
  end

  def search
    @search = Patient.search() do
      keywords(params[:search_str])
    end
  end

  def todays_list

  end

  def daily_collection
    @patients = 5000
    respond_to do |format|
      format.js
    end
  end

  def monthly_collection

  end

  def yearly_collection

  end

end
