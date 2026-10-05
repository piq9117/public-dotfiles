local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
"                                                         ",
"                                                         ",
"                                                         ",
"                                                         ",
"                                                         ",
"                                                         ",
"                                                         ",
"                                                         ",
"                                                         ",
"                                                         ",
"                                                         ",
"██    ██ ███████  ██████ ██   ██  ██████  ██████  ███████",
"██    ██ ██      ██      ██   ██ ██    ██ ██   ██ ██     ",
"██    ██ ███████ ██      ███████ ██    ██ ██   ██ █████  ",
" ██  ██       ██ ██      ██   ██ ██    ██ ██   ██ ██     ",
"  ████   ███████  ██████ ██   ██  ██████  ██████  ███████",
}

dashboard.section.buttons.val = {}

alpha.setup(dashboard.opts)
