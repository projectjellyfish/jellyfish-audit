module JellyfishAudit
  class Engine < ::Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)
    isolate_namespace JellyfishAudit
  end
end
