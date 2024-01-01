module ApplicationHelper
  include Pagy::Frontend

  def release_id
    case Rails.env
    when 'development'
      env_shorthand = 'DEV'
    when 'production'
      env_shorthand = 'PROD'
    when 'test'
      env_shorthand = 'TEST'
    else
      env_shorthand = 'OTHER'
    end
    if ENV['DEPLOYMENT_ID'] == nil
      env_shorthand + ' | nil'
    else
      env_shorthand + ' | ' + ENV['DEPLOYMENT_ID'].to_s
    end
  end
end
