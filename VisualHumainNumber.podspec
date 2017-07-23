Pod::Spec.new do |s|

  s.name		    = 'VisualHumainNumber'
  s.version         = "1.0.8" 
  s.license 		= { :type => "MIT", :file => "LICENSE" }
  s.platform      	= :ios, '8.0'
  s.summary 		= 'Display big number with abbreviation'

  s.homepage 		= 'https://github.com/Armanoide/VisualHumainNumber'
  s.author 		    = { 'Billa Norbert' => 'norbert.billa@gmail.com' }
  s.source 		    = { :git => 'https://github.com/Armanoide/VisualHumainNumber.git', :tag => "V#{s.version}"  }
  s.source_files 	= 'SRC/*.{swift}'
  s.requires_arc 	= true
  s.frameworks 		= 'Foundation'

end
