class ApplicationController < ActionController::Base
  include Pagy::Backend
  include SearchConcern
end
