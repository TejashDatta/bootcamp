rails credentials:show

EDITOR="code --wait" bin/rails credentials:edit

echo $RAILS_MASTER_KEY

rails c
Rails.application.credentials.secret_key_base

EDITOR="code --wait" rails credentials:edit --environment staging

rails credentials:show --environment staging
