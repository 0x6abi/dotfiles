# kanagawa colorscheme
config.source('colors.py')

# do not load gui config
config.load_autoconfig(False)

c.colors.webpage.preferred_color_scheme = 'dark'
c.completion.cmd_history_max_items = 5000
c.completion.delay = 0
c.completion.height = '30%'
c.completion.min_chars = 3
c.completion.quick = True

# fonts
c.fonts.completion.category = "Mononoki Nerd Font"
c.fonts.completion.entry = "Mononoki Nerd Font"
c.fonts.default_family = "Mononoki Nerd Font"
c.fonts.default_size = '24px'
