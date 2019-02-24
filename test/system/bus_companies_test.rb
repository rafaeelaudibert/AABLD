# frozen_string_literal: true

require 'application_system_test_case'

class BusCompaniesTest < ApplicationSystemTestCase
  setup do
    @bus_company = bus_companies(:one)
  end

  test 'visiting the index' do
    visit bus_companies_url
    assert_selector 'h1', text: 'Bus Companies'
  end

  test 'creating a Bus company' do
    visit bus_companies_url
    click_on 'New Bus Company'

    fill_in 'Address', with: @bus_company.address
    fill_in 'City', with: @bus_company.city
    fill_in 'Cnpj', with: @bus_company.cnpj
    fill_in 'Name', with: @bus_company.name
    fill_in 'Neighborhood', with: @bus_company.neighborhood
    click_on 'Create Bus company'

    assert_text 'Bus company was successfully created'
    click_on 'Back'
  end

  test 'updating a Bus company' do
    visit bus_companies_url
    click_on 'Edit', match: :first

    fill_in 'Address', with: @bus_company.address
    fill_in 'City', with: @bus_company.city
    fill_in 'Cnpj', with: @bus_company.cnpj
    fill_in 'Name', with: @bus_company.name
    fill_in 'Neighborhood', with: @bus_company.neighborhood
    click_on 'Update Bus company'

    assert_text 'Bus company was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Bus company' do
    visit bus_companies_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Bus company was successfully destroyed'
  end
end
