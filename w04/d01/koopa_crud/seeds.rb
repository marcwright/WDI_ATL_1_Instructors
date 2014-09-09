require 'active_record'

require_relative 'config.rb'
require_relative 'models/koopa.rb'

Koopa.create(name: "Dumdum", color: "green", has_shell: true, photo_url: "http://img1.wikia.nocookie.net/__cb20110724132501/nintendo/en/images/8/83/KoopaNSMB.png")
Koopa.create(name: "Bird Dragon", color: "red", has_shell: true, photo_url: "http://upload.wikimedia.org/wikipedia/en/7/75/Koopa_Troopa_3D_Land.png")
Koopa.create(name: "Sarah", color: "green", has_shell: true, photo_url: "http://img1.wikia.nocookie.net/__cb20110724132501/nintendo/en/images/8/83/KoopaNSMB.png")
Koopa.create(name: "Marper the Darper", color: "red", has_shell: true, photo_url: "http://upload.wikimedia.org/wikipedia/en/7/75/Koopa_Troopa_3D_Land.png")
