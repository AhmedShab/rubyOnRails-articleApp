class WelcomeController < ApplicationController
  def home
    redirect_to articles_path if is_logged_in
  end
  def about
    #code
  end
end
