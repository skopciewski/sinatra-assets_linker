# frozen_string_literal: true

require "test_helper"
require "sinatra-assets_linker"

class SinatraApp
  helpers Sinatra::AssetsLinker

  get "/get_css" do
    css_uri "file.css"
  end

  get "/get_js" do
    js_uri "file.js"
  end

  get "/get_img" do
    img_uri "file.jpg"
  end
end

class AssetsLinkerTest < Minitest::Test
  include ::Rack::Test::Methods

  def app
    ::SinatraApp
  end

  def setup
    @config = SinatraAssetsLinker::Config.new
    @config_verbose = SinatraAssetsLinker::Config.new project_assets_verbose: true
    @cdn_config = SinatraAssetsLinker::Config.new project_cdn_url: "http://cdn.net"
    @cdn_config_verbose = SinatraAssetsLinker::Config.new(
      project_cdn_url: "http://cdn.net", project_assets_verbose: true
    )
  end

  def test_get_css
    app.configure { |c| c.set :assets_linker_config, @config }
    get("/get_css")
    assert_equal true, last_response.ok?
  end

  def test_default_css_path
    app.configure { |c| c.set :assets_linker_config, @config }
    get("/get_css")
    expected_path = File.join("http://example.org", @config["project_css_dir"], "file.css")
    assert_equal expected_path, last_response.body
  end

  def test_css_path_with_cdn
    app.configure { |c| c.set :assets_linker_config, @cdn_config }
    get("/get_css")
    expected_path = File.join(
      @cdn_config["project_cdn_url"], @cdn_config["project_css_dir"], "file.css"
    )
    assert_equal expected_path, last_response.body
  end

  def test_get_img
    app.configure { |c| c.set :assets_linker_config, @config }
    get("/get_img")
    assert_equal true, last_response.ok?
  end

  def test_default_img_path
    app.configure { |c| c.set :assets_linker_config, @config }
    get("/get_img")
    expected_path = File.join("http://example.org", @config["project_images_dir"], "file.jpg")
    assert_equal expected_path, last_response.body
  end

  def test_img_path_with_cdn
    app.configure { |c| c.set :assets_linker_config, @cdn_config }
    get("/get_img")
    expected_path = File.join(
      @cdn_config["project_cdn_url"], @cdn_config["project_images_dir"], "file.jpg"
    )
    assert_equal expected_path, last_response.body
  end

  def test_get_js
    app.configure { |c| c.set :assets_linker_config, @config }
    get("/get_js")
    assert_equal true, last_response.ok?
  end

  def test_default_js_path
    app.configure { |c| c.set :assets_linker_config, @config }
    get("/get_js")
    expected_path = File.join(
      "http://example.org", @config["project_js_compressed_dir"], "file.js"
    )
    assert_equal expected_path, last_response.body
  end

  def test_js_path_with_cdn
    app.configure { |c| c.set :assets_linker_config, @cdn_config }
    get("/get_js")
    expected_path = File.join(
      @cdn_config["project_cdn_url"], @cdn_config["project_js_compressed_dir"], "file.js"
    )
    assert_equal expected_path, last_response.body
  end

  def test_verbose_js_path
    app.configure { |c| c.set :assets_linker_config, @config_verbose }
    get("/get_js")
    expected_path = File.join(
      "http://example.org", @config_verbose["project_javascripts_dir"], "file.js"
    )
    assert_equal expected_path, last_response.body
  end

  def test_verbose_js_path_with_cdn
    app.configure { |c| c.set :assets_linker_config, @cdn_config_verbose }
    get("/get_js")
    expected_path = File.join(
      @cdn_config_verbose["project_cdn_url"],
      @cdn_config_verbose["project_javascripts_dir"],
      "file.js"
    )
    assert_equal expected_path, last_response.body
  end
end
