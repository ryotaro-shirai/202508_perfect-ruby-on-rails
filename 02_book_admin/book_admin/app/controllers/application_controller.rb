class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # 開発者モードは modern browser として認識されないので、本番環境のみに適用
  if Rails.env.production?
    allow_browser versions: :modern
  end

  before_action :detect_mobile_variant

  private

    def detect_mobile_variant
      request.variant = :mobile if request.user_agent =~ /iPhone/
    end
end
