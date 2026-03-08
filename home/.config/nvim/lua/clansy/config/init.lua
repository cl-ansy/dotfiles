-- Do not require autocmds, keymaps, lazy or options under lua/config/ or lazyvim.config manually.
-- LazyVim will load those files automatically.
require("clansy.config.settings")
require("clansy.config.options")
require("clansy.config.keymaps")
require("clansy.config.lazy")
require("clansy.config.themes")
