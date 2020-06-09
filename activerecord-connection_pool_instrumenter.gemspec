# frozen_string_literal: true

require_relative 'lib/active_record/connection_pool_instrumenter/version'

Gem::Specification.new do |spec|
  spec.name     = 'activerecord-connection_pool_instrumenter'
  spec.version  = ActiveRecord::ConnectionPoolInstrumenter::VERSION
  spec.authors  = ['Glia TechMovers']
  spec.email    = ['techmovers@glia.com']
  spec.summary  = 'Metrics about the activerecord connection pool usage'
  spec.homepage = 'https://github.com/salemove/activerecord-connection_pool_instrumenter'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord'
  spec.add_dependency 'concurrent-ruby', '~> 1.1'

  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'statsd-ruby', '~> 1.4'
  spec.add_development_dependency 'sqlite3', '~> 1.4'
end
