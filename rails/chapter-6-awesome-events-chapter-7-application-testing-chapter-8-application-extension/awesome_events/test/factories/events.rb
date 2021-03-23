FactoryBot.define do
  factory :event do
    owner
    sequence(:name) { |i| "event name #{i}" }
    sequence(:place) { |i| "event place #{i}" }
    sequence(:content) { |i| "event content #{i}" }
    start_at { rand(1..30).days.from_now }
    end_at { start_at + rand(1..30).hours }
  end
end
