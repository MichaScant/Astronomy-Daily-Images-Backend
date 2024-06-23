class WelcomePageController < ApplicationController
  def welcome
      render html: 'Welcome! This is the front end for the web service api'
  end
end
