#
# Be sure to run `pod lib lint PopcornNotify.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'PopcornNotify'
    s.version          = '1.0.2'
    s.summary          = 'Send simple emails and text messages from one API, in Swift.'
    
    s.description      = <<-DESC
    Send simple emails and text messages from one API, in Swift. A PopcornNotify.com wrapper for iOS.
    DESC
    
    s.homepage         = 'https://github.com/imryan/popcornnotify-swift'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Ryan Cohen' => 'notryancohen@gmail.com' }
    s.source           = { :git => 'https://github.com/imryan/popcornnotify-swift.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/ryancohen'
    
    s.ios.deployment_target = '8.0'
    s.source_files = 'PopcornNotify/Classes/**/*'
end
