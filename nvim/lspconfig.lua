require('lsp-zero')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, 'LSP: [R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'LSP: [C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, 'LSP: [G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, 'LSP: [G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, 'LSP: [G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'LSP: Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'LSP: [D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'LSP: [W]orkspace [S]ymbols')

  nmap('K', vim.lsp.buf.hover, 'LSP: Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'LSP: Signature Documentation')

  nmap('gD', vim.lsp.buf.declaration, 'LSP: [G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'LSP: [W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'LSP: [W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'LSP: [W]orkspace [L]ist Folders')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = { "lua_ls", "ts_ls", "gopls", "rust_analyzer", "dartls", "hls" }

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

