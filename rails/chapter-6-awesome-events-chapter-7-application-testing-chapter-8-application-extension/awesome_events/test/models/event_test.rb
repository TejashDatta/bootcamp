require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test '#created_by? when owner_id same as #id parameter stub' do
    event = FactoryBot.create(:event)
    user = User.new
    user.stub(:id, event.owner_id) do
      assert_equal(true, event.created_by?(user))
    end
  end

  test '#created_by? when owner_id same as #id parameter mock' do
    event = FactoryBot.create(:event)
    user = MiniTest::Mock.new.expect(:id, event.owner_id)
    assert_equal(true, event.created_by?(user))
    user.verify
  end

  test '#created_by? when owner_id different from #id parameter' do
    assert_equal(false, FactoryBot.create(:event).created_by?(FactoryBot.create(:user)))
  end

  test '#created_by? when parameter is nil' do
    assert_equal(false, FactoryBot.create(:event).created_by?(nil))
  end

  test 'start_at_should_be_before_end_at validation OK' do
    start_at = rand(1..30).days.from_now
    event = FactoryBot.build(:event,
                             start_at: start_at,
                             end_at: start_at + rand(1..30).hours)
    event.valid?
    assert_empty(event.errors[:start_at])
  end

  test 'start_at_should_be_before_end_at validation error' do
    start_at = rand(1..30).days.from_now
    event = FactoryBot.build(:event,
                             start_at: start_at,
                             end_at: start_at - rand(1..30).hours)
    event.valid?
    assert_not_empty(event.errors[:start_at])
  end
end
