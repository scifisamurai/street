class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges,
  # import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # As per pg 135 of Agile Web Development with Rails 8:
  # - connect Active Storage to our views
  # NOTE:
  # Only needed if we're storing files on disk.
  # If using the cloud you don't need this line.
  include ActiveStorage::SetCurrent
end
