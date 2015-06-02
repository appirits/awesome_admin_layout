module AwesomeAdminLayout
  class Converter
    def initialize(script)
      @script = script
    end

    def to_html
      "<ul>#{script_to_html}</ul>"
    end

    private

    def script_to_html
      @script.to_a.map do |obj|
        case obj
        when String
          "<li><a>#{obj}</a></li>"
        when NilClass
          '<li class="divider"></li>'
        end
      end.join
    end
  end
end
