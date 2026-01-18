# frozen_string_literal: true

class HomeController < ApplicationController
  layout "administrate"

  def index
    @articles = Article.all
  end
end
