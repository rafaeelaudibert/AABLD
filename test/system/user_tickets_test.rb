# frozen_string_literal: true

require 'application_system_test_case'

class UserTicketsTest < ApplicationSystemTestCase
  setup do
    @user_ticket = user_tickets(:one)
  end

  test 'visiting the index' do
    visit user_tickets_url
    assert_selector 'h1', text: 'User Tickets'
  end

  test 'creating a User ticket' do
    visit user_tickets_url
    click_on 'New User Ticket'

    fill_in 'Original price', with: @user_ticket.original_value
    fill_in 'Quantity', with: @user_ticket.quantity
    fill_in 'Ticket', with: @user_ticket.ticket_id
    fill_in 'User', with: @user_ticket.user_id
    click_on 'Create User ticket'

    assert_text 'User ticket was successfully created'
    click_on 'Back'
  end

  test 'updating a User ticket' do
    visit user_tickets_url
    click_on 'Edit', match: :first

    fill_in 'Original price', with: @user_ticket.original_value
    fill_in 'Quantity', with: @user_ticket.quantity
    fill_in 'Ticket', with: @user_ticket.ticket_id
    fill_in 'User', with: @user_ticket.user_id
    click_on 'Update User ticket'

    assert_text 'User ticket was successfully updated'
    click_on 'Back'
  end

  test 'destroying a User ticket' do
    visit user_tickets_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'User ticket was successfully destroyed'
  end
end
