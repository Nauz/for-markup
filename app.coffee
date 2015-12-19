axis                  = require 'axis'
rupture               = require 'rupture'
autoprefixer          = require 'autoprefixer'
js_pipeline           = require 'js-pipeline'
css_pipeline          = require 'css-pipeline'
accord                = require 'accord'
postcss               = accord.load 'postcss'
lost                  = require 'lost'
postcss_font_magician = require 'postcss-font-magician'
bg_img_sizes          = require 'postcss-image-sizes'
easy_sprites          = require 'postcss-easysprites'
oldie                 = require 'oldie'
typographic           = require 'typographic'
cssnano               = require 'cssnano'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee'),
    css_pipeline(files: 'assets/css/*.styl')
  ]

  stylus:
    use: [axis(), rupture(), typographic()]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true

  postcss:
    use: [
      lost(),
      postcss_font_magician(),
      bg_img_sizes({
        assetsPath: 'assets/img'
        }),      
      easy_sprites({
        imagePath:  'public/img', 
        spritePath: 'public/img',
        stylesheetPath: 'public/css'
        }),
      autoprefixer(),
      cssnano()
    ]


