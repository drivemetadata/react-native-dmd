require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-dmd"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "12.0" }
  s.source       = { :git => "https://github.com/ranjeetranjan/react-native-dmd.git", :tag => "#{s.version}" }
  s.source_files = "ios/**/*.{h,c,m,,mm,swift}"
  s.requires_arc = true
  s.dependency 'DriveMetaDataiOSSDK'
  s.dependency "React-Core"
  
end
