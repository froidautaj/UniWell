# README
This is the project that was done for the TM470 module at Open University. It is a forum platform where university students can help each other mentally and physically during their studies.
On your terminal, it is important when you run the website you should run:
rails db:create
rails db:migrate
rails db:seed
Then run rails s, so that the website can run locally and can see how the platform looks like.


It is also important to include these third parties for previewing both images and files, the link below has the details of installing libvips, ImageMagic and poppler:
https://edgeguides.rubyonrails.org/active_storage_overview.html

1. brew install vips
2. brew install imagemagick
3. brew install ghostscript
