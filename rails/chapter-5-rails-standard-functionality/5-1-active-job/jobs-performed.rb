AsyncLogJob.perform_later
AsyncLogJob.perform_now
AysncLog.last

AsyncLogJob.perform_later(message: 'hi')

AsyncLogJob.set(wait: 1.minute).perform_later

puts AsyncLog.last.to_global_id
