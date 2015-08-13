require 'minitest_helper'

class AwesomeAdminLayoutTest < Minitest::Test
  def test_that_define_should_be_successful
    AwesomeAdminLayout.normal_define do
      navigation do
        item 'default_test'
      end
    end

    assert_match /default_test/, AwesomeAdminLayout.script.to_html
  end

  def test_that_define_should_be_successful_to_define_the_two_navigations
    AwesomeAdminLayout.normal_define do
      navigation :first do
        item 'first_test'
      end
    end

    AwesomeAdminLayout.normal_define do
      navigation :second do
        item 'second_test'
      end
    end

    assert_match /first_test/, AwesomeAdminLayout.script.to_html(:first)
    assert_match /second_test/, AwesomeAdminLayout.script.to_html(:second)
  end
end
