# do not load gui config
config.load_autoconfig(False)
# load kanagawa colorscheme
config.source('colors.py')
# load keybindings
config.source('keybindings.py')

c.auto_save.session = False
c.changelog_after_upgrade = 'major'

c.colors.webpage.preferred_color_scheme = 'dark'

c.completion.cmd_history_max_items = 5000
c.completion.delay = 0
c.completion.height = '30%'
c.completion.min_chars = 1
c.completion.quick = True

c.editor.command = ["foot", "nvim", "{file}"]
c.editor.remove_file = True

# fonts
c.fonts.completion.category = 'Cascadia Code'
c.fonts.completion.entry = 'Cascadia Code'
c.fonts.default_family = 'Cascadia Code'
c.fonts.default_size = '17px'
