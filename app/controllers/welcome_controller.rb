# frozen_string_literal: true

class WelcomeController < ApplicationController
  layout false
  skip_before_action :authenticate_user!

  def index; end
end
