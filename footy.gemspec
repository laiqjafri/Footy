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
  s.files         = `git ls-files`.split("\n")
  s.license       = 'MIT'
end
