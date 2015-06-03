module AwesomeAdminLayout
  module Helpers
    module ClassMethods
      def awesome_admin_layout(&block)
        before_filter -> { AwesomeAdminLayout.awesome_admin_layout(request, &block) }
      end
    end

    def render_admin_layout(&block)
      <<-HTML
        <div id="awesome_admin_layout">
          <nav class="awesome_admin_layout-navigation">
            <div class="awesome_admin_layout-wrapper">
              #{AwesomeAdminLayout.script.to_html}
            </div>
          </nav>

          <main class="awesome_admin_layout-main">
            <div class="awesome_admin_layout-navigation-toggle">
              <i class="fa fa-bars"></i>
            </div>
            #{defined?(::Rails) ? capture(&block) : yield}
          </main>
        </div>
      HTML
    end
  end
end
