# frozen_string_literal: true

module BusCompaniesHelper
  def monthly_travel_chart_for(bus_company)
    pre_data = bus_company.user_tickets
                          .group_by { |ut| date_hash_string ut.created_at }
                          .map { |key, value| [key, value.sum(&:quantity)] }
                          .to_h

    data = UserTicket.group_by_month(:created_at, last: 12).count
                     .map { |ut| [ut[0], pre_data.fetch(date_hash_string(ut[0]), 0)] }

    options = create_chart_options(title: 'Viagens',
                                   subtitle: 'Agrupado por Mês',
                                   xtitle: 'Mês',
                                   ytitle: 'Viagens',
                                   palette: 'palette7')

    area_chart({ name: 'Viagens', data: data }, options)
  end

  def monthly_value_chart_for(bus_company)
    pre_data = bus_company.user_tickets
                          .group_by { |ut| date_hash_string ut.created_at }
                          .map { |key, value| [key, value.sum(&:total)] }
                          .to_h

    data = UserTicket.group_by_month(:created_at, last: 12).count
                     .map { |ut| [ut[0], pre_data.fetch(date_hash_string(ut[0]), 0)] }

    options = create_chart_options(title: 'Valor',
                                   subtitle: 'Agrupado por Mês',
                                   xtitle: 'Mês',
                                   ytitle: 'Valor')

    area_chart({ name: 'Valor', data: data }, options)
  end
end
