class AsyncLogJob < ApplicationJob
  # queue_as :async_log
  queue_as do
    case self.arguments.first[:message]
    when 'to_async_log' then :async_log
    else :default
    end
  end

  def perform(message: 'hello')
    AsyncLog.create!(message: message)
  end

  retry_on ArgumentError, ZeroDivisionError, wait: 3.seconds, attempts: 5, queue: :retry, priority: 5 do |job, error|
    puts job, error
  end

  discard_on StandardError do |job, error|
    puts job, error
  end
end
