Rails.application.routes.draw do
  mount JellyfishAudit::Engine => '/jellyfish_audit'
end
