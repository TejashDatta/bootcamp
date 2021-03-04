AsyncLogJob.perform_later(message: 'from sidekiq')
AsyncLogJob.perform_later(message: 'in async_log queue')

AsyncLogJob.set(queue: :another_queue).perform_later(message: 'from another queue')

AsyncLogJob.perform_later(message: 'to_async_log')
AsyncLogJob.perform_later(message: 'default queue')
