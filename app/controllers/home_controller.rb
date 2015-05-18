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
end
