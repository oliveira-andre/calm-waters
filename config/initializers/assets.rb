Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( *.js *.scss, vali-admin.js vali-admin.css devise/sessions.js devise/sessions.scss)
