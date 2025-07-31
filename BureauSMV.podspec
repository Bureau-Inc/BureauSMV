Pod::Spec.new do |spec|
  spec.name         = 'BureauSMV'
  spec.version      = '0.0.3'
  spec.summary      = 'BureauSMV is our silent mobile verification solution'
  spec.description  = 'BureauSMV, also know as OTL(one tap login) is enable iOS apps to login user silently using our SMV technology.'
  spec.homepage     = 'https://www.bureau.id/'
  spec.license      = 'MIT'
  spec.authors      = {'Bureau-Inc' => 'techops@bureau.id'}
  spec.platform     = :ios, '13.0'

  spec.source       = { :git => 'https://github.com/Bureau-Inc/BureauSMV.git', :tag => spec.version.to_s }
  
  spec.vendored_frameworks = '**/*.xcframework'
  spec.swift_version = '5.0'
  
end
