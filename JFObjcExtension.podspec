#
# Be sure to run `pod lib lint JFObjcExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JFObjcExtension'
  s.version          = '0.1.0'
  s.summary          = 'A short description of JFObjcExtension.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jumpingfrog0/JFObjcExtension'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jumpingfrog0' => 'huangdonghong2@yy.com' }
  s.source           = { :git => 'https://github.com/jumpingfrog0/JFObjcExtension.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Source/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JFObjcExtension' => ['Source/Assets/*.png']
  # }

  # s.public_header_files = 'Source/Classes/**/*.h'
  # s.frameworks = 'Foundation', 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
