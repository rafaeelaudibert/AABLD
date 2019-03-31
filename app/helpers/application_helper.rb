# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend
  include EnumI18nHelper

  def paginate(pagy)
    "<div class='float-right'>#{pagy_bootstrap_nav(pagy)}</div>"
  end
end
