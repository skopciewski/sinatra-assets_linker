# encoding: utf-8

# Copyright (C) 2015,2016 Szymon Kopciewski
#
# This file is part of SinatraAssetsLinker.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require "sinatra/base"

module Sinatra
  module AssetsLinker
    def css_uri(file_name, add_script_name = true)
      css_dir = get_settings(:project_css_dir)
      generate_uri(css_dir, file_name, add_script_name)
    end

    def js_uri(file_name, add_script_name = true)
      javascript_dir = get_settings(:project_javascripts_dir)
      js_dir = get_settings(:project_js_compressed_dir)
      choosen_dir = get_settings(:project_assets_verbose) ? javascript_dir : js_dir
      generate_uri(choosen_dir, file_name, add_script_name)
    end

    def img_uri(file_name, add_script_name = true)
      img_dir = get_settings(:project_images_dir)
      generate_uri(img_dir, file_name, add_script_name)
    end

    private

    def get_settings(key)
      settings.assets_linker_config.fetch(key.to_s)
    end

    def generate_uri(assets_dir, file_name, add_script_name)
      absolute_path = false
      relative_url = uri(File.join(assets_dir, file_name), absolute_path, add_script_name)
      cdn_url = get_settings(:project_cdn_url)
      return File.join(cdn_url, relative_url) unless cdn_url.nil?
      relative_url
    end
  end
end
