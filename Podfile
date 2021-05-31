#Podfile
use_frameworks!

platform :ios, '14.0'

## I use this to share pods between more targets whenever I need it
def sharedPods
	pod 'Alamofire', '~> 5.2'
	pod 'Kingfisher', '~> 6.0'
end

target 'MoviesDisplayer' do
    sharedPods
end
