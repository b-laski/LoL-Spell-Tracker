# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'LoL Spell Tracker' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for LoL Spell Tracker
  pod 'SnapKit', '~> 5.0.0'
  pod 'Moya', '~> 13.0'
  pod 'SwiftLint'
  pod 'moa', '~> 11.0'


  def testing_pods 
    pod 'Quick'
    pod 'Nimble'
    pod 'Mockingjay'
  end

  target 'LoL Spell TrackerTests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

  target 'LoL Spell TrackerUITests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

end
