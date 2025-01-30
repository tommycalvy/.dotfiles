require("tommycalvy.opts_and_keys")

-- NOTE: register the extra lze handlers because we want to use them.
require("lze").register_handlers(require('lze.x'))
-- NOTE: also add another one that makes enabling a spec for a category nicer
require("lze").register_handlers(require('nixCatsUtils.lzUtils').for_cat)

require("tommycalvy.plugins")

require("tommycalvy.LSPs")

