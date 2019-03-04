# frozen_string_literal: true

require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test 'should get index' do
    get tickets_url
    assert_response :success
  end

  test 'should get new' do
    get new_ticket_url
    assert_response :success
  end

  test 'should create ticket' do
    assert_difference('Ticket.count') do
      post tickets_url, params: {
        ticket: { bus_company_id: @ticket.bus_company_id,
                  destination_city_id: @ticket.destination_city_id,
                  source_city_id: @ticket.source_city_id,
                  value: @ticket.value }
      }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test 'should show ticket' do
    get ticket_url(@ticket)
    assert_response :success
  end

  test 'should get edit' do
    get edit_ticket_url(@ticket)
    assert_response :success
  end

  test 'should update ticket' do
    patch ticket_url(@ticket), params: {
      ticket: { bus_company_id: @ticket.bus_company_id,
                destination_city_id: @ticket.destination_city_id,
                source_city_id: @ticket.source_city_id,
                value: @ticket.value }
    }
    assert_redirected_to ticket_url(@ticket)
  end

  test 'should destroy ticket' do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end
end
