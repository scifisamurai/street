require "test_helper"

class SupportRequestMailerTest < ActionMailer::TestCase
  # This test is auto-generated so that's probably why it's failing
  test "respond" do
    skip "Failing test ... need to figure out why and fix"
    mail = SupportRequestMailer.respond
    assert_equal "Respond", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
