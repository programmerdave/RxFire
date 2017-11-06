Pod::Spec.new do |s|
  s.name             = 'RxFire'
  s.version          = '0.0.1'
  s.summary          = 'An RxSwift wrapper for Firebase'

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This library simplifies the process of implementing Firebase interactions.'

  s.homepage         = 'https://github.com/programmerdave/RxFire'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Private', :file => 'LICENSE' }
  s.authors          = { 'Colton Nohelty' => 'noheltycolton@gmail.com','David Rodriguez' => 'programmerdave@gmail.com' }
  s.source           = { :git => 'git@github.com:programmerdave/RxFire.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'RxFire/Source/**/*'
  # s.resource_bundles = {
  #   'Paymentasaurus' => ['paymentasaurus-sdk/Assets/*']
  # }

  # Shared Dependencies
  s.dependency 'RxSwift', '~> 3.5.0'
  s.dependency 'Swinject', '~> 2.1.0'
  s.dependency 'SwiftyJSON', '~> 3.1.4'
  s.dependency 'Alamofire', '~> 4.4.0'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

end
