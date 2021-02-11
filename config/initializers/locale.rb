Rails.application.configure do
  I18n.enforce_available_locales = false
  config.i18n.available_locales = %i[ja en]
  config.i18n.default_locale = :ja
end
