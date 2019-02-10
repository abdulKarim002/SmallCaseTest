# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def network_pods
    pod 'Alamofire'
end

def data_CRUD_pods
    pod 'SwiftyJSON', '~> 4.0'
end

def ui_pods
    pod 'PKHUD', '~> 5.0'
    pod 'Kingfisher'
    pod 'SwiftChart'
end


def shared_pods
    network_pods
    data_CRUD_pods
    ui_pods
    
end


target 'SmallCaseTest' do
  use_frameworks!

  shared_pods

end

target 'SmallCaseTestDev' do
  use_frameworks!

  shared_pods

end
