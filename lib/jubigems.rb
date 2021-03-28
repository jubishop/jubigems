require 'geminabox'
require 'sinatra/content_for'
require 'sinatra/static'

Geminabox.allow_replace = true
Geminabox.build_legacy = false
Geminabox.data = '.data/geminabox'
Geminabox.lockfile = File.join(ENV['TMPDIR'], 'geminabox.lockfile')
Geminabox.rubygems_proxy = false

module JubiGems
  class Server < Geminabox::Server
    helpers Sinatra::ContentFor
    register Sinatra::Static

    set(public_folder: 'public')
    set(views: 'views')

    before {
      # rubocop:disable Style/StringHashKeys
      headers('X-Powered-By' => 'JubiGems')
      # rubocop:enable Style/StringHashKeys
    }
  end
end
