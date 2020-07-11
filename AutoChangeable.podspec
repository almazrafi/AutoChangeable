Pod::Spec.new do |spec|
  spec.name = "AutoChangeable"
  spec.version = "1.0.0"
  spec.summary = "Convenient way to copy instances of Swift types with changed properties"

  spec.homepage = "https://github.com/almazrafi/AutoChangeable"
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { "Almaz Ibragimov" => "almazrafi@gmail.com" }
  spec.source = { :git => "https://github.com/almazrafi/AutoChangeable.git", :tag => "#{spec.version}" }

  spec.swift_version = '5.1'
  spec.requires_arc = true
  spec.source_files = 'Sources/**/*.swift'
  spec.preserve_path = 'Bin/**/*'

  spec.ios.frameworks = 'Foundation'
  spec.ios.deployment_target = "10.0"

  spec.osx.frameworks = 'Foundation'
  spec.osx.deployment_target = "10.12"

  spec.watchos.frameworks = 'Foundation'
  spec.watchos.deployment_target = "3.0"

  spec.tvos.frameworks = 'Foundation'
  spec.tvos.deployment_target = "10.0"
end
