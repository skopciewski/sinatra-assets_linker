require 'sinatra/base'

module Sinatra
  module AssetsLinker

    def css_uri(file_name)
      cdn_url = get_settings(:cdn_url)
      css_dir = get_settings(:css_dir, 'stylesheets')
      generate_uri cdn_url, css_dir, file_name
    end

    private

    def get_settings(key, default = nil)
      settings.respond_to?(key) ? settings.send(key) : default
    end

    def generate_uri(cdn_url, assets_dir, file_name)
      absolute_path = false
      relative_url = uri File.join(assets_dir, file_name), absolute_path
      return File.join(cdn_url, relative_url) unless cdn_url.nil?
      relative_url
    end

  end
end
