require 'minitest_helper'

class TestRecognizePath < Minitest::Test
  def setup
    @dummy_class = Class.new
    @dummy_class.send(:extend, AwesomeAdminLayout::RecognizePath)
  end

  if defined? Rails
    def test_successed_recognize_path
      refute_nil @dummy_class.recognize_path('/products')
    end

    def test_failed_recognize_path
      assert_nil @dummy_class.recognize_path('/products/unknown')
    end

    def test_successed_recognize_path_for_engine
      refute_nil @dummy_class.recognize_path('/engine/products')
    end

    def test_failed_recognize_path_for_engine
      assert_nil @dummy_class.recognize_path('/engine/products/unknown')
    end
  end

  def test_active_url?
    fullpath = '/test'

    request = MiniTest::Mock.new
    AwesomeAdminLayout.class_variable_set(:@@request, request)

    test_with_rails do
      request.expect :fullpath, fullpath
      assert @dummy_class.active_url?(fullpath)
    end

    test_without_rails do
      request.expect :fullpath, fullpath
      assert @dummy_class.active_url?(fullpath)
    end
  end

  def test_same_url?
    test_without_rails do
      assert @dummy_class.send(:same_url?, '/test', '/test')
    end

    test_with_rails do
      assert @dummy_class.send(:same_url?, '/test', '/test')
    end
  end

  private

  def test_with_rails
    yield if defined? Rails
  end

  def test_without_rails
    if defined? Rails
      klass = Object.send(:const_get, :Rails)
      Object.send(:remove_const, :Rails)
      yield
      Object.send(:const_set, :Rails, klass)
    else
      yield
    end
  end
end
