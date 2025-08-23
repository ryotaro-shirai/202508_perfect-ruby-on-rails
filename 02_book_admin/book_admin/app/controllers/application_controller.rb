class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # 開発者モードは modern browser として認識されないので、本番環境のみに適用
  if Rails.env.production?
    allow_browser versions: :modern
  end
end
