Pod::Spec.new do |s|
  s.name             = "FloatLabelRow"
  s.version          = "1.0.0"
  s.summary          = "A short description of FloatLabelRow."
  s.homepage         = "https://github.com/KarinaFernandez/FloatLabelRow"
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.author           = { "Xmartlabs SRL" => "swift@xmartlabs.com" }
  s.source           = { git: "https://github.com/KarinaFernandez/FloatLabelRow.git", tag: s.version.to_s }
  s.social_media_url = 'https://twitter.com/KarinaFernandez'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.ios.source_files = 'FloatLabelRow/Sources/**/*.{swift}'
  # s.resource_bundles = {
  #   'FloatLabelRow' => ['FloatLabelRow/Sources/**/*.xib']
  # }
  # s.ios.frameworks = 'UIKit', 'Foundation'
  s.dependency 'Eureka', '~> 3.0'
end
