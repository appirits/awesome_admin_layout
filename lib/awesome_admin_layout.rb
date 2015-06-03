require 'awesome_admin_layout/version'
require 'awesome_admin_layout/script'
require 'awesome_admin_layout/navigation'
require 'awesome_admin_layout/engine' if defined? Rails

module AwesomeAdminLayout
  def included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    @@request = nil

    def self.request
      @@request
    end

    def script
      @script ||= AwesomeAdminLayout::Script.new
    end

    def admin_layout(request, &block)
      @@request = request
      script.instance_eval(&block)
    end

    def render_admin_layout(&block)
      <<-HTML
        <div id="awesome_admin_layout">
          <nav class="awesome_admin_layout-navigation">
            <div class="awesome_admin_layout-wrapper">
              #{script.to_html}
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
