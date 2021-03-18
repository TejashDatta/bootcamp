rails g factory_bot:model user
rails g factory_bot:model event

# in rails c
require 'factory_bot_rails'
FactoryBot.create(:event)
