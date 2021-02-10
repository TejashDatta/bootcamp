rails g model Publisher name:string address:text
rails g model Author name:string penname:string
rails db:migrate

rails g migration AddPublisherToBooks publisher:references
rails db:reset
rails db:migrate 
