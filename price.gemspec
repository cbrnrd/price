
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'price'

Gem::Specification.new do |spec|
  spec.name          = "price"
  spec.version       = Price::VERSION
  spec.authors       = ["cbrnrd"]
  spec.email         = ["cbawsome77@gmail.com"]
  spec.date          = Time.now.strftime('%Y-%m-%d')

  spec.summary       = %q{Get cryptocurrency prices in your terminal}
  spec.homepage      = "https://github.com/cbrnrd/price"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = %w[price]
  spec.require_paths = ['lib']


  spec.add_runtime_dependency 'paint'
  spec.add_runtime_dependency 'terminal-table'
  spec.add_runtime_dependency 'http'
  spec.add_runtime_dependency 'activesupport'

end
