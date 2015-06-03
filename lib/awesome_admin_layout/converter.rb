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
          "<li>#{obj}</li>"
        when Navigation::Item, Navigation::Divider, Navigation::FlexDivider
          obj.to_s
        end
      end.join
    end
  end
end
