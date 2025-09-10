vim.pack.add({
    { src = "https://github.com/shaunsingh/nord.nvim" },
    { src = "https://github.com/echasnovski/mini.nvim" },
    { src = "https://github.com/saghen/blink.cmp", version = "v1.6.0" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/j-hui/fidget.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/sazikov-a/agl.nvim" },
    { src = "https://github.com/sazikov-a/arc.nvim" }
})

require "nvim-autopairs".setup()
require "mini.pick".setup()
require "mini.comment".setup({
    mappings = {
        comment = '//',
        comment_line = '///',
        comment_visual = '//',
        textobject = '//'
    }
})
require "blink.cmp".setup({
    keymap = { preset = "enter" },
    completion = { documentation = { auto_show = true } }
})

require "fidget".setup()
require "telescope".load_extension("fidget")

require "nvim-treesitter.configs".setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})

require "arc".setup()

