class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere

  # Any email to (or CC'd to) support@example.com
  # should be handles by the class: SupportMailbox
  routing "support@example.com" => :support
end
