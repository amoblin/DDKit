# coding: utf-8
Pod::Spec.new do |s|

  s.name         = "DDUIKit"
  s.version      = "0.4"
  s.summary      = "DDKit provides convenient tools for build ui."

  s.description  = <<-DESC
DDKit provides convenient tools for build ui."
                   DESC

  s.homepage     = "https://github.com/amoblin/DDKit"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "amoblin" => "amoblin@gmail.com" }
  # s.social_media_url   = "http://twitter.com/amoblin@mbp"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.8"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/amoblin/DDKit.git", :tag => "#{s.version}" }

  s.source_files  = "DDKit", "DDKit/**/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"

  s.public_header_files = "DDKit/**/*.h"

  s.requires_arc = true

  s.osx.exclude_files = ["DDKit/iOS]"]
  s.ios.exclude_files = ["DDKit/OSX]"]

  s.dependency 'JSONModel'
  s.dependency 'Masonry'
end
