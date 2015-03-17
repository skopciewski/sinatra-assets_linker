require 'spec_helper'
require 'sinatra/assets_linker'

class SinatraApp
  helpers Sinatra::AssetsLinker

  get '/get_css' do
    css_uri 'file.css'
  end
end

module Sinatra
  describe AssetsLinker do
    include ::Rack::Test::Methods

    def app
      ::SinatraApp
    end

    describe 'css path' do
      Given(:css_file) { 'file.css' }
      Given(:css_dir) { 'css_dir' }
      Given(:cdn) { 'http://cdn.net' }

      When { get('/get_css') }
      Invariant { last_response.ok? }

      context 'without css dir' do
        Then { last_response.body == File.join('/', 'stylesheets', css_file) }
      end

      context 'with css_dir' do
        Given { app.configure { |c| c.set :css_dir, css_dir } }
        Then { last_response.body == File.join('/', css_dir, css_file) }
      end

      context 'with cdn_url' do
        Given { app.configure { |c| c.set :cdn_url, cdn } }
        Then { last_response.body == File.join(cdn, css_dir, css_file) }
      end
    end

  end
end
