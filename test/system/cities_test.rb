# frozen_string_literal: true

require 'application_system_test_case'

class CitiesTest < ApplicationSystemTestCase
  setup do
    @city = cities(:one)
  end

  test 'visiting the index' do
    visit cities_url
    assert_selector 'h1', text: 'Cities'
  end
end
