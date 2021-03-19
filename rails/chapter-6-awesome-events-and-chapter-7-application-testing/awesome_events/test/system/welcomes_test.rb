require "application_system_test_case"

class WelcomesTest < ApplicationSystemTestCase
  test '/ display' do
    visit root_url
  
    assert_selector "h1", text: "イベント一覧"
  end

  test '/ display future event and hide past event' do
    future_event = FactoryBot.create(:event, start_at: Time.zone.now + 3.day)
    past_event = FactoryBot.create(:event, start_at: Time.zone.now + 1.day)

    travel_to Time.zone.now + 2.day do
      visit root_url
      assert_selector 'h5', text: future_event.name
      assert_no_selector 'h5', text: past_event.name
    end
  end
end
