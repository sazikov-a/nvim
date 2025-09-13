vim.lsp.enable({
    "lua_ls",
    "clangd",
    "agl_ls",
    "pyright",
    "gopls"
})

vim.lsp.inlay_hint.enable()

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            diagnostics = { globals = { "vim" } },
            telemetry = { enabled = false },
            workspace = {
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false
            }
        }
    }
})

vim.lsp.config('clangd', {
    cmd = {
        'ya',
        'tool',
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--header-insertion=never',
        '--completion-style=detailed',
        '-j=56',
        '--enable-config',
        '--pretty',
        '--log=info',
        '--compile-commands-dir='..vim.fn.getcwd()
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable vim.lsp.completion',
  callback = function(event)
    local client_id = vim.tbl_get(event, 'data', 'client_id')
    if client_id == nil then
      return
    end

    vim.lsp.completion.enable(true, client_id, event.buf, {autotrigger = true})
  end
})

