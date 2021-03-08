require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'welcome' do
    email = UserMailer.with(to: 'tejash@eg.com', name: 'tejash').welcome
    assert_emails(1) { email.deliver_now }
    assert_equal ['niltux@gmail.com'], email.from
    assert_equal ['tejash@eg.com'], email.to
    assert_equal 'Registration complete', email.subject
    assert_includes email.text_part.decoded, 'tejash'
    assert_includes email.html_part.decoded, 'tejash'
  end
end
