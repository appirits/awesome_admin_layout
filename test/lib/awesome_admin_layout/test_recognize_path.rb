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

    test_both_with_rails_and_without_rails do
      request = MiniTest::Mock.new
      request.expect :fullpath, fullpath
      AwesomeAdminLayout.class_variable_set(:@@request, request)

      assert @dummy_class.active_url?(fullpath)
    end
  end

  def test_same_url?
    test_both_with_rails_and_without_rails do
      assert @dummy_class.send(:same_url?, '/test', '/test')
    end
  end

  private

  def test_both_with_rails_and_without_rails
    if defined? Rails
      # with Rails
      yield

      # without Rails
      klass = Object.send(:const_get, :Rails)
      Object.send(:remove_const, :Rails)
      yield
      Object.send(:const_set, :Rails, klass)
    else
      # without Rails
      yield
    end
  end
end
