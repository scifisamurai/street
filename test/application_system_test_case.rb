require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # :firefox, :safari, and :edge are also supported browsers
  # as per Iteration G3 in the book.
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
end
