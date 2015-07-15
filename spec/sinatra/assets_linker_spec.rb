require "spec_helper"
require "sinatra/assets_linker"

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

module Sinatra
  describe AssetsLinker do
    include ::Rack::Test::Methods
    def app
      ::SinatraApp
    end

    Given(:cdn) { "http://cdn.net" }

    describe "css paths" do
      Given(:css_file) { "file.css" }
      Given(:css_dir) { "css_dir" }

      When { get("/get_css") }
      Invariant { last_response.ok? }

      context "without css dir" do
        Then { last_response.body == File.join("/", "stylesheets", css_file) }
      end

      context "with css_dir" do
        Given { app.configure { |c| c.set :project_css_dir, css_dir } }
        Then { last_response.body == File.join("/", css_dir, css_file) }
      end

      context "with cdn_url" do
        Given { app.configure { |c| c.set :project_cdn_url, cdn } }
        Then { last_response.body == File.join(cdn, css_dir, css_file) }
      end
    end

    describe "js paths" do
      Given(:js_file) { "file.js" }
      Given(:js_dir) { "js_dir" }
      Given(:rjs_dir) { "rjs_dir" }

      When { get("/get_js") }
      Invariant { last_response.ok? }

      context "without js dir" do
        Given { app.configure { |c| c.set :project_cdn_url, nil } }
        Then { last_response.body == File.join("/", "js", js_file) }
      end

      context "with js_dir" do
        Given { app.configure { |c| c.set :project_js_dir, js_dir } }
        Then { last_response.body == File.join("/", js_dir, js_file) }
      end

      context "with cdn_url" do
        Given { app.configure { |c| c.set :project_cdn_url, cdn } }
        Then { last_response.body == File.join(cdn, js_dir, js_file) }
      end

      context "with verbose assets enabled" do
        Given { app.configure { |c| c.set :project_cdn_url, nil } }
        Given { app.configure { |c| c.set :project_assets_verbose, true } }
        Then { last_response.body == File.join("/", "javascripts", js_file) }
      end

      context "with verbose assets enabled and rjs_dir" do
        Given { app.configure { |c| c.set :project_rjs_dir, rjs_dir } }
        Then { last_response.body == File.join("/", rjs_dir, js_file) }
      end

      context "with verbose assets enabled and cdn_url" do
        Given { app.configure { |c| c.set :project_cdn_url, cdn } }
        Then { last_response.body == File.join(cdn, rjs_dir, js_file) }
      end
    end

    describe "img paths" do
      Given(:img_file) { "file.jpg" }
      Given(:img_dir) { "img_dir" }

      When { get("/get_img") }
      Invariant { last_response.ok? }

      context "without img dir" do
        Given { app.configure { |c| c.set :project_cdn_url, nil } }
        Then { last_response.body == File.join("/", "images", img_file) }
      end

      context "with img_dir" do
        Given { app.configure { |c| c.set :project_img_dir, img_dir } }
        Then { last_response.body == File.join("/", img_dir, img_file) }
      end

      context "with cdn_url" do
        Given { app.configure { |c| c.set :project_cdn_url, cdn } }
        Then { last_response.body == File.join(cdn, img_dir, img_file) }
      end
    end
  end
end
