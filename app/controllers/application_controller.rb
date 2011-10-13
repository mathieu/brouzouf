class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :mailer_set_url_options
#  before_filter :adjust_format_for_iphone

private
  def adjust_format_for_iphone
        request.format = :ios if ios_user_agent?
  end

  def ios_user_agent?
      request.env["HTTP_USER_AGENT"]
      request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
  end

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end
