rails new active_job_example
rails g model async_log message

rails g job async_log

rails test test/jobs
