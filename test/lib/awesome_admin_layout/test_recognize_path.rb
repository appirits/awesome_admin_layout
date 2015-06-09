require 'minitest_helper'

class TestRecognizePath < Minitest::Test
  def setup
    @dummy_class = Class.new
    @dummy_class.send(:extend, AwesomeAdminLayout::RecognizePath)
  end

  if defined? Rails
    def test_successed_recognize_path
      refute_nil @dummy_class.recognize_path('/admin')
    end

    def test_failed_recognize_path
      assert_nil @dummy_class.recognize_path('/admin/products')
    end
  end

  def test_active_url?
    fullpath = '/test'

    request = MiniTest::Mock.new
    request.expect :fullpath, fullpath
    AwesomeAdminLayout.class_variable_set(:@@request, request)

    assert @dummy_class.active_url?(fullpath)
  end

  def test_same_url?
    assert @dummy_class.send(:same_url?, '/test', '/test')
  end
end
