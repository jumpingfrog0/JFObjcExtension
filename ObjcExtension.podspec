#
# Be sure to run `pod lib lint JFUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ObjcExtension'
  s.version          = '0.1.0'
  s.summary          = 'A collection of Objective-C category excepts Foundation and UIKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A collection of Objective-C category excepts Foundation and UIKit.
                       DESC

  s.homepage         = 'https://github.com/jumpingfrog0/ObjcExtension'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jumpingfrog0' => 'jumpingfrog0@gmail.com' }
  s.source           = { :git => 'https://github.com/jumpingfrog0/ObjcExtension.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.resource_bundles = {
  	'ObjcExtension' => ['Source/Assets/*.png']
  }

  s.frameworks = 'Foundation', 'UIKit', 'CoreGraphics'

  s.source_files = 'Source/Classes/**/*.{h,m}'
  
  s.dependency 'SDWebImage', '~> 4.4.2'
end
