Pod::Spec.new do |spec|
  spec.name         = "IRGallery"
  spec.version      = "0.1.1"
  spec.summary      = "A powerful gallery of iOS."
  spec.description  = "A powerful gallery of iOS."
  spec.homepage     = "https://github.com/irons163/IRGallery.git"
  spec.license      = "MIT"
  spec.author       = "irons163"
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/irons163/IRGallery.git", :tag => spec.version.to_s }
  spec.source_files  = "IRGallery/**/*.{h,m}"
  spec.public_header_files = 'IRGallery/**/IRGallery.h', 'IRPasscode/**/IRGalleryViewController.h'
end