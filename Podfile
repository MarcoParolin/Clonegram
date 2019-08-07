workspace 'Clonegram.xcworkspace'
platform :ios, '12.0'

def network_manager_pods
  
#   KEYCHAIN UTIL
#  pod 'Locksmith'
#   NETWORKING
  pod 'Alamofire'
  
end

def clonegram_pods
  
#  BETTER CONSTRAINTS
  pod 'SnapKit'
  
#  EASY WAY TO GET ASYNC IMAGES
  pod 'SDWebImage'
  pod 'SwiftVideoBackground'
  
#  UTILS PODS
  pod 'R.swift'
  pod 'SwiftLint'
  
#  DEBUG
  pod 'Reveal-SDK', :configurations => ['Debug']

end
  
target 'Clonegram' do
  use_frameworks!
  inhibit_all_warnings!
  
  # Import pods
  network_manager_pods
  clonegram_pods
  
end

target 'NetworkManager' do
  use_frameworks!
  inhibit_all_warnings!
  
  network_manager_pods

  project 'NetworkManager/NetworkManager'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    plist_buddy = "/usr/libexec/PlistBuddy"
    plist = "Pods/Target Support Files/#{target}/Info.plist"
    
    puts "Add arm64 to #{target} to make it pass iTC verification."
    
    `#{plist_buddy} -c "Add UIRequiredDeviceCapabilities array" "#{plist}"`
    `#{plist_buddy} -c "Add UIRequiredDeviceCapabilities:0 string arm64" "#{plist}"`
  end
end

