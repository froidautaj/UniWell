# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# pin 'jquery', to: 'jquery-3.7.1.min.js', preload: true
pin 'bootstrap', to: 'bootstrap.bundle.min.js', preload: true
pin 'owl.carousel', to: 'owl.carousel.min.js', preload: true
pin 'jquery-te', to: 'jquery-te-1.4.0.min.js', preload: true
# pin 'multi-file', to: 'query.multi-file.min.js', preload: true
# pin 'selectize', to: 'selectize.min.js', preload: true
# pin 'main', to: 'main.js', preload: true
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
