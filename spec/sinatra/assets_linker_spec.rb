require 'spec_helper'
require 'sinatra/assets_linker'

class SinatraApp
  helpers Sinatra::AssetsLinker

  get '/get_css' do
    css_ulr "plik.css"
  end
end

module Sinatra
  describe AssetsLinker do
    include ::Rack::Test::Methods

    def app
      ::SinatraApp
    end

    describe 'test' do
      When { get('/get_css') }
      Then { last_response.ok? }
      Then { last_response.body == 'plik.css' }
    end

  end
end
