#
# Be sure to run `pod lib lint SwiftGeoCombine.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftGeoCombine'
  s.version          = '0.1.0'
  s.summary          = 'A simply pleasant reactive geolocation library using Combine'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Ben Bahrenburg/SwiftGeoCombine'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ben Bahrenburg' => 'hello@bencoding.com' }
  s.source           = { :git => 'https://github.com/Ben Bahrenburg/SwiftGeoCombine.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/bencoding'

  s.ios.deployment_target = '13.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  s.source_files = 'SwiftGeoCombine/Classes/**/*'
  s.frameworks = 'CoreLocation'
  
  # s.resource_bundles = {
  #   'SwiftGeoCombine' => ['SwiftGeoCombine/Assets/*.png']
  # }
end
