# frozen_string_literal: true

module UniversitiesHelper
  def university_monthly_user_chart_for(university)
    pre_data = university.user_tickets
                         .group_by { |ut| date_hash_string ut.created_at }
                         .map { |key, value| [key, value.map(&:user_id).uniq.count] }
                         .to_h

    data = UserTicket.group_by_month(:created_at, last: 12).count
                     .map { |ut| [ut[0], pre_data.fetch(date_hash_string(ut[0]), 0)] }

    options = create_chart_options(title: 'Alunos',
                                   subtitle: 'Agrupado por Mês',
                                   xtitle: 'Mês',
                                   ytitle: 'Alunos',
                                   palette: 'palette7')

    area_chart({ name: 'Alunos', data: data }, options)
  end

  def university_monthly_value_chart_for(university)
    pre_data = university.user_tickets
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
