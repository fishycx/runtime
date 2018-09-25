def btsURLRequest_pods
    pod 'Alamofire'
    pod 'CryptoSwift'
    pod 'SwiftyJSON'
end

target 'BTSURLRequest' do
    project 'BTSURLRequest/BTSURLRequest.project'
    btsURLRequest_pods
end
