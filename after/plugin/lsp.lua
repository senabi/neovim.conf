local lsp = require("lsp-zero")
local diagnosticls = require("diagnosticls-configs")

local function register_fmt_keymap(name, bufnr)
  -- vim.keymap.set("n", "<leader>f", function()
  --   print("formatting", name)
  --   vim.lsp.buf.format(vim.tbl_extend("force", { timeout_ms = 10000, async = false }, {
  --     name = name,
  --     bufnr = bufnr,
  --   }))
  -- end, { buffer = bufnr, desc = "[lsp] format" })

  -- uncomment to enable format on save
  --[[
      local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
      local event = "BufWritePre" -- or "BufWritePost"
      local async = event == "BufWritePost"
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
      ]]
  -- end

  -- vim.keymap.set("x", "<leader>f", function()
  --   vim.lsp.buf.format({ bufnr = bufnr, name = name, timeout_ms = 10000, async = false })
  -- end, {
  --   buffer = bufnr
  --   ,
  --   desc = "[lsp] format"
  -- })
end


lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'html',
  'cssls',
  'tailwindcss',
  'jsonls',
  'diagnosticls',
  'ols'
})

require('mason-tool-installer').setup({
  ensure_installed = {
    'eslint_d',
    'prettier',
    -- 'stylua',
    -- 'codelldb',
  }
})


-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

-- diagnosticls.init({
--   on_attach = function(_, bufnr)
--     register_fmt_keymap("diagnosticls", bufnr)
--     -- register_fmt_autosave("diagnosticls", bufnr)
--   end,
-- })

local eslint = require 'diagnosticls-configs.linters.eslint'

local web_configs = {
  --  linter = eslint,
  --   formatter = require("diagnosticls-configs.formatters.prettier"),
}


diagnosticls.setup({
  javascript = web_configs,
  javascriptreact = web_configs,
  typescript = web_configs,
  typescriptreact = web_configs,
  -- lua = {
  --   formatter = require("diagnosticls-configs.formatters.stylua"),
  -- },
})
