rails new awesome_events --skip-action-mailer skip-action-mailbox skip-action-text --skip-action-cable

rails hamlit:erb2haml

rails g controller welcome index

yarn add bootstrap@4.4.1 jquery@3.5.1 popper.js@1.16.1

# auth

rails g model user provider uid name image_url

rails g controller sessions

# event

rails g resource event owner_id:bigint name place start_at:datetime end_at:datetime content:text
