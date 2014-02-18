Pod::Spec.new do |s|
  s.name             = "ATContainerViewController"
  s.version          = "0.1.0"
  s.summary          = "ATContainerViewController is a ViewController that can have multiple childcontrollers, configured using custom segues."
  s.description      = <<-DESC
                       ATContainerViewController is a ViewController that switches between child viewcontrollers, configured using custom segues.
                       DESC
  s.homepage         = "https://github.com/jansabbe/ATContainerViewController"
  s.license          = 'MIT'
  s.author           = { "Jan Sabbe" => "jan.sabbe@gmail.com" }
  s.source           = { :git => "https://github.com/jansabbe/ATContainerViewController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jansabbe'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/AT*.{h,m}'
end
