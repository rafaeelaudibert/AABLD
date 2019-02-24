# frozen_string_literal: true

require 'test_helper'

class BusCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_company = bus_companies(:one)
  end

  test 'should get index' do
    get bus_companies_url
    assert_response :success
  end

  test 'should get new' do
    get new_bus_company_url
    assert_response :success
  end

  test 'should create bus_company' do
    assert_difference('BusCompany.count') do
      post bus_companies_url,
           params: { bus_company: { address: @bus_company.address,
                                    city: @bus_company.city,
                                    cnpj: @bus_company.cnpj,
                                    name: @bus_company.name,
                                    neighborhood: @bus_company.neighborhood } }
    end

    assert_redirected_to bus_company_url(BusCompany.last)
  end

  test 'should show bus_company' do
    get bus_company_url(@bus_company)
    assert_response :success
  end

  test 'should get edit' do
    get edit_bus_company_url(@bus_company)
    assert_response :success
  end

  test 'should update bus_company' do
    patch bus_company_url(@bus_company),
          params: { bus_company: { address: @bus_company.address,
                                   city: @bus_company.city,
                                   cnpj: @bus_company.cnpj,
                                   name: @bus_company.name,
                                   neighborhood: @bus_company.neighborhood } }
    assert_redirected_to bus_company_url(@bus_company)
  end

  test 'should destroy bus_company' do
    assert_difference('BusCompany.count', -1) do
      delete bus_company_url(@bus_company)
    end

    assert_redirected_to bus_companies_url
  end
end
