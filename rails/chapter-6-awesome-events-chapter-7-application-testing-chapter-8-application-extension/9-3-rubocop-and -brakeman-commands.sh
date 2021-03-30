bundle exec rubocop

bundle exec rubocop --auto-gen-config

bundle exec brakeman
bundle exec brakeman -A
# 軽微な問題まで含める
bundle exec brakeman -w1
