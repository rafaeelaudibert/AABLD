# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend
  include EnumI18nHelper

  def paginate(pagy)
    "<div class='float-right'>#{pagy_bootstrap_nav(pagy)}</div>"
  end

  def date_hash_string(date)
    "#{date.month}/#{date.year}"
  end

  def create_chart_options(title: 'Title',
                           subtitle: 'Subtitle',
                           xtitle: 'Xtitle',
                           ytitle: 'Ytitle',
                           palette: 'palette4')
    {
      title: title,
      subtitle: subtitle,
      xtitle: xtitle,
      ytitle: ytitle,
      theme: palette,
      xaxis: { labels: { format: 'MMM' } }
    }
  end
end
