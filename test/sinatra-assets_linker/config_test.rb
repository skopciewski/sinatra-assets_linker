# frozen_string_literal: true

require "test_helper"
require "sinatra-assets_linker/config"

class ConfigTest < Minitest::Test
  def setup
    @config = SinatraAssetsLinker::Config.new
  end

  def test_default_config_is_valid
    assert @config.valid?
  end

  def test_configuration_has_default_project_css_dir_value
    assert_equal "stylesheets", @config.fetch("project_css_dir")
  end

  def test_configuration_has_default_project_javascript_dir_value
    assert_equal "javascripts", @config.fetch("project_javascripts_dir")
  end

  def test_configuration_has_default_project_js_compressed_dir_value
    assert_equal "js", @config.fetch("project_js_compressed_dir")
  end

  def test_configuration_has_default_project_images_compressed_dir_value
    assert_equal "images", @config.fetch("project_images_dir")
  end

  def test_configuration_has_default_project_assets_verbose_value
    refute @config.fetch("project_assets_verbose")
  end

  def test_configuration_has_default_project_cdn_url_value
    assert_nil @config.fetch("project_cdn_url")
  end
end
