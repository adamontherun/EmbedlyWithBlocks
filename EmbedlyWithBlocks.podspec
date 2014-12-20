#
#  Be sure to run `pod spec lint EmbedlyWithBlocks.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "EmbedlyWithBlocks"
    s.version      = "0.1.0"
    s.summary      = "Objective-C library for Embed.ly APIs"
    s.homepage     = "https://github.com/adamontherun/EmbedlyWithBlocks"
    s.license      = { :type => "MIT", :file => "LICENSE.txt" }
    s.author       = "Adam Smith"
    s.source       = { :git => "https://github.com/adamontherun/EmbedlyWithBlocks.git", :tag => "0.1.0" }
    s.source_files  = "Classes", "Classes/*.{h,m}"
    s.requires_arc = true
end
