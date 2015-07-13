Pod::Spec.new do |s|
  s.name         = "badgeValue"
  s.version      = "1.0"
  s.summary      = "not need any share client"

  s.description  = <<-DESC
                   not need any share client.
                   DESC

  s.homepage     = "https://github.com/YAANNZ/badgeValue"
  s.license      = "MIT"
  s.author       = { "ZYYNN" => "zhuynchn@163.com" }
  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/YAANNZ/badgeValue.git", :tag => s.version }
  s.source_files  = "badgeValue", "MJRefresh/**/*.{h,m}"
 
  s.resource = "MJRefresh/MJRefresh.bundle"

  s.requires_arc = true
end
