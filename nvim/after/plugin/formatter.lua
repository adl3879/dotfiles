local has_formatter, formatter = pcall(require, 'formatter')

if not has_formatter then
  return
end

local function prettier()
  return {
    exe = 'prettier',
    args = {
      '--config-precedence',
      'prefer-file',
      '--single-quote',
      '--no-bracket-spacing',
      '--prose-wrap',
      'always',
      '--arrow-parens',
      'always',
      '--trailing-comma',
      'all',
      '--no-semi',
      '--end-of-line',
      'lf',
      '--print-width',
      vim.bo.textwidth,
      '--stdin-filepath',
      vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
    },
    stdin = true,
  }
end

local function gofmt()
    return {
        exe = "gofmt",
        args = {},
        stdin = true
    }
end

local function goimports()
    return {
        exe = "goimports",
        args = {},
        stdin = true
    }
end

vim.api.nvim_command 'augroup FormatAutogroup'
vim.api.nvim_command 'autocmd!'
vim.api.nvim_command 'autocmd BufWritePost * FormatWrite'
vim.api.nvim_command 'augroup END'

formatter.setup {
  logging = false,
  filetype = {
    javascript = { prettier },
    typescript = { prettier },
    javascriptreact = { prettier },
    typescriptreact = { prettier },
    vue = { prettier },
    ['javascript.jsx'] = { prettier },
    ['typescript.tsx'] = { prettier },
    markdown = { prettier },
    css = { prettier },
    json = { prettier },
    jsonc = { prettier },
    scss = { prettier },
    less = { prettier },
    yaml = { prettier },
    graphql = { prettier },
    html = { prettier },
    go = { gofmt, goimports },
  },
}
