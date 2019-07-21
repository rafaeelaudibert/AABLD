# frozen_string_literal: true

module UsersHelper
  def user_monthly_travel_chart_for(user)
    data = user.user_tickets.group_by_month(:created_at, last: 12).count

    options = create_chart_options(title: 'Viagens',
                                   subtitle: 'Agrupado por Mês',
                                   xtitle: 'Mês',
                                   ytitle: 'Viagens',
                                   palette: 'palette7',
                                   stacked: true)

    column_chart({ name: 'Viagens', data: data }, options)
  end

  def user_monthly_value_chart_for(user)
    pre_data = user.user_tickets
                   .group_by { |ut| date_hash_string ut.created_at }
                   .map { |key, value| [key, value.sum(&:total)] }
                   .to_h

    data = UserTicket.group_by_month(:created_at, last: 12).count
                     .map { |ut| [ut[0], pre_data.fetch(date_hash_string(ut[0]), 0)] }

    options = create_chart_options(title: 'Valor',
                                   subtitle: 'Agrupado por Mês',
                                   xtitle: 'Mês',
                                   ytitle: 'Valor',
                                   palette: 'palette6',
                                   stacked: true)

    column_chart({ name: 'Valor', data: data }, options)
  end
end
