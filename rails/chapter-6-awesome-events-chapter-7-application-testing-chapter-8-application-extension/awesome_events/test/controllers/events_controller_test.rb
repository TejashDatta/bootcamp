require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test 'delete own event' do
    event_owner = FactoryBot.create(:user)
    event = FactoryBot.create(:event, owner: event_owner)
    sign_in_as event_owner
    assert_difference('Event.count', -1) do
      delete event_url(event)
    end
  end

  test "cannot delete other's event" do
    event = FactoryBot.create(:event, owner: FactoryBot.create(:user))
    sign_in_as FactoryBot.create(:user)
    assert_difference('Event.count', 0) do
      assert_raises(ActiveRecord::RecordNotFound) do
        delete event_url(event)
      end
    end
  end
end
