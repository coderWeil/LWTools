
Pod::Spec.new do |s|

  s.name         = "LWTools"
  s.version      = "2.1.1.3"
  s.summary      = "一些常用的工具类"
  s.description  = "1.对文件的简单加密，解密功能  2.判断设备剩余空间的大小  3.添加view分类  4.粒子动画特效的按钮 5.从一张view中生成图片 6.增加标签选择功能（可显示小红点） 7.类似微信图片浏览功能 8.多种动画效果  9.自定义基于MJRefresh的上拉加载下拉刷新动画  10.自定义window，放到状态栏位置，点击scrollView滚动到顶部"

  s.homepage     = "https://github.com/LittleCuteCat/LWTools"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "LittleCuteCat" => "weil218@163.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/LittleCuteCat/LWTools.git", :tag => "#{s.version}" }

  s.dependency "SDWebImage"
   
  s.dependency "MJRefresh"

  s.dependency "LWPhotoBrowser"

  s.dependency "LWAnimation"

  s.source_files  = 'LWTools/*'

end
