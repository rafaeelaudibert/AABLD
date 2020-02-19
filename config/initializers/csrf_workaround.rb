# frozen_string_literal: true

# Removes CSRF protection because login is not working on Chrome
Rails.application.config.action_controller.forgery_protection_origin_check = false
