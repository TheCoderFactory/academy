require 'test_helper'

class AcademyApplicationMailerTest < ActionMailer::TestCase
  test "response" do
    mail = AcademyApplicationMailer.response
    assert_equal "Response", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "received" do
    mail = AcademyApplicationMailer.received
    assert_equal "Received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
