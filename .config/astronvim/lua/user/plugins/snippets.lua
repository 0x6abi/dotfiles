return {
    {
        "L3MON4D3/LuaSnip",
        opts = {
            enable_autosnippets = true,
        },
        config = function(plugins, opts)
            -- include astrovim defaults
            require("plugins.configs.luasnip")(plugins, opts)
            -- load custom snippets
            -- -- set absolute path to avoid scanning files
            require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/lua/user/snippets/" } })
        end,
    },
    {
        "evesdropper/luasnip-latex-snippets.nvim",
        ft = "tex",
    },
}
