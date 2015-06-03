require 'awesome_admin_layout/version'
require 'awesome_admin_layout/script'
require 'awesome_admin_layout/navigation'

module AwesomeAdminLayout
  def included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def script
      @script ||= AwesomeAdminLayout::Script.new
    end

    def admin_layout(&block)
      script.instance_eval(&block)
    end

    def render_admin_layout(&block)
      <<-HTML
        <div id="awesome_admin_layout">
          <nav class="awesome_admin_layout-navigation">
            <div class="awesome_admin_layout-wrapper">
              <div class="awesome_admin_layout-brand">
                AwesomeAdminLayout
              </div>
              #{@script.to_html}
            </div>
          </nav>

          <main class="awesome_admin_layout-main">
            #{block.call}
          </main>
        </div>
      HTML
    end
  end
end
