module AwesomeAdminLayout
  module Helpers
    module ClassMethods
      def awesome_admin_layout(&block)
        before_action -> { AwesomeAdminLayout.awesome_admin_layout(self, &block) }
      end
    end

    def render_admin_layout(key = nil, &block)
      html = <<-HTML
        <div id="awesome_admin_layout">
          #{AwesomeAdminLayout.script.to_html(key)}

          <main class="awesome_admin_layout-main">
            <div class="awesome_admin_layout-navigation-toggle">
              <i class="fa fa-bars"></i>
            </div>
            #{defined?(::Rails) ? capture(&block) : yield}
          </main>
        </div>
      HTML
      html = html.html_safe if html.respond_to? :html_safe
      html
    end
  end
end
