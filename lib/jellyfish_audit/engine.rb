module JellyfishAudit
  class Engine < ::Rails::Engine
    isolate_namespace JellyfishAudit
    config.autoload_paths += %W(#{config.root}/lib)
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
