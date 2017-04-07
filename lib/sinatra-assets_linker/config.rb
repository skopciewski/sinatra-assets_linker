# frozen_string_literal: true

# Copyright (C) 2015, 2016, 2017 Szymon Kopciewski
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

require "piko_model"

module SinatraAssetsLinker
  class Config < PikoModel::Model
    field "project_css_dir", default: "stylesheets"
    field "project_javascripts_dir", default: "javascripts"
    field "project_js_compressed_dir", default: "js"
    field "project_images_dir", default: "images"
    field "project_assets_verbose", default: false
    field "project_cdn_url", default: nil
  end
end
