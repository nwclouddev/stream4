# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def release_id
    env_shorthand = case Rails.env
                    when 'development'
                      'DEV'
                    when 'production'
                      'PROD'
                    when 'test'
                      'TEST'
                    else
                      'OTHER'
                    end
    if ENV['DEPLOYMENT_ID'].nil?
      "#{env_shorthand} | nil"
    else
      "#{env_shorthand} | #{ENV['DEPLOYMENT_ID']}"
    end
  end
end
