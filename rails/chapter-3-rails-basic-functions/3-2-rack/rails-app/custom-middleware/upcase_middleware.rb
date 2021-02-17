# lib/middlewares/

class UpcaseMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, header, body = @app.call(env)
    body.each { |s| s.gsub!(/ruby/i, 'RUBY') }
    [status, header, body]
  end
end
