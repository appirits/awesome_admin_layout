require 'awesome_admin_layout/version'
require 'awesome_admin_layout/script'
require 'awesome_admin_layout/converter'

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
          <header class="awesome_admin_layout-sidebar">
            #{AwesomeAdminLayout::Converter.new(@script).to_html}
          </header>

          <main class="awesome_admin_layout-main">
            #{block.call}
          </main>
        </div>
      HTML
    end
  end
end
