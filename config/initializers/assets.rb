# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w[
  font_awesome_all.min.css
  tempusdominus-bootstrap-4.min.css
  icheck-bootstrap.min.css
  jqvmap.min.css
  adminlte.min.css
  OverlayScrollbars.min.css
  daterangepicker.css
  summernote-bs4.min.css

  adminlte.js
  bootstrap.bundle.min.js
  jquery.min.js
  jquery-ui.min.js
  Chart.min.js
  sparkline.js
  jquery.vmap.min.js
  jquery.vmap.usa.js
  jquery.knob.min.js
  moment.min.js
  daterangepicker.js
  tempusdominus-bootstrap-4.min.js
  summernote-bs4.min.js
  jquery.overlayScrollbars.min.js
  select2.full.js
  jquery.bootstrap-duallistbox.min.js
  jquery.inputmask.min.js
  daterangepicker.js
  bootstrap-colorpicker.min.js
  bootstrap-switch.min.js
  bs-stepper.min.js
  dropzone.min.js
]
