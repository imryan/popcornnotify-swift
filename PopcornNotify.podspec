#
# Be sure to run `pod lib lint PopcornNotify.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'PopcornNotify'
    s.version          = '1.0.0'
    s.summary          = 'PopcornNotify in Swift.'
    
    s.description      = <<-DESC
    PopcornNotify in Swift written for iOS.
    DESC
    
    s.homepage         = 'https://github.com/imryan/PopcornNotify'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Ryan Cohen' => 'notryancohen@gmail.com' }
    s.source           = { :git => 'https://github.com/imryan/PopcornNotify.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/ryancohen'
    
    s.ios.deployment_target = '8.0'
    s.source_files = 'PopcornNotify/Classes/**/*'
end
