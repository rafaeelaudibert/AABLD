# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def paginate(pagy)
    "<div class='float-right'>#{pagy_bootstrap_nav(pagy)}</div>"
  end
end
