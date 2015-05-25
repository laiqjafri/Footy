# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "footy/version"

Gem::Specification.new do |s|
  s.name          = 'footy'
  s.version       = Footy::VERSION
  s.date          = '2015-05-22'
  s.summary       = "Footy!"
  s.description   = "A simple plugin for accessing your football API @ football-api.com"
  s.authors       = ["Laiq Jafri"]
  s.email         = 'laiq@tekstart.us'
  s.homepage      = "http://github.com/laiqjafri/Footy"
  s.files         = [
    'lib/footy.rb',
    'lib/footy/configuration.rb',
    'lib/footy/api.rb',
    'lib/footy/version.rb',
    'lib/footy/competition.rb',
    'lib/footy/fixture.rb',
    'lib/footy/team.rb',
    'lib/footy/player.rb',
    'lib/footy/commentary.rb',
    'lib/footy/substitution.rb',
  ]
  s.license       = 'MIT'
end
