# Ruby module that can recognize paths of the main Rails application as well as the engines.
# from: https://gist.github.com/jtanium/6114632
module AwesomeAdminLayout
  module RecognizePath
    def active_url?(url)
      return false unless AwesomeAdminLayout.request
      same_url? AwesomeAdminLayout.request.fullpath, url
    end

    # TODO: Add tests
    def recognize_path(path, options = {})
      recognized_path = Rails.application.routes.recognize_path(path, options)
      # We have a route that catches everything and sends it to 'errors#not_found', you might
      # need to rescue ActionController::RoutingError
    rescue ActionController::RoutingError
      # The main app didn't recognize the path, try the engines...
      Rails::Engine.subclasses.each do |engine|
        engine_instance = engine.instance
        # Find the route to the engine, e.g. '/blog' -> Blog::Engine (a.k.a. "mount")
        engine_class = engine_instance.class
        engine_route = Rails.application.routes.routes.find { |r| app_class_for(r) == engine_class }
        next unless engine_route

        # The engine won't recognize the "mount", so strip it off the path,
        # e.g. '/blog/posts/new'.gsub(%r(^/blog), '') #=> '/posts/new', which will be recognized by the engine
        path_for_engine = path.gsub(/^#{engine_route.path.spec}/, '')

        begin
          recognized_path = engine_instance.routes.recognize_path(path_for_engine, options)
        rescue ActionController::RoutingError => e
          Rails.logger.debug "[#{engine}] ActionController::RoutingError: #{e.message}"
        end
      end

      recognized_path
    end

    private

    def same_url?(first_url, second_url)
      if defined? Rails
        first_path = recognize_path(first_url)
        return false unless first_path
        second_path = recognize_path(second_url)
        return false unless second_path
        first_path[:controller] == second_path[:controller]
      else
        first_url.split('?').first.match(/^#{second_url.split('?').first}(\/\d*)?$/)
      end
    end

    def app_class_for(route)
      if Rails.version =~ /^4.2./
        # for Rails 4.2
        route.app.app
      else
        # for Rails 4.1, 4.0, 3.2
        route.app
      end
    end
  end
end
