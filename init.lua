do
    -- Setting up globals

    vim.loader.enable()
    vim.g.maplocalleader = ' '
    vim.g.have_nerd_font = true


    -- Setting up options
    vim.o.number = true -- Show line numbers in a column.
    vim.g.mapleader = ' '
    vim.o.relativenumber = true
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true
    vim.api.nvim_create_autocmd('UIEnter', {
      callback = function()
        vim.o.clipboard = 'unnamedplus'
      end,
    })
    -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
    vim.o.ignorecase = true
    vim.o.smartcase = true

    vim.o.cursorline = true -- Highlight the line where the cursor is on.
    vim.o.scrolloff = 10 -- Keep this many screen lines above/below the cursor.

    vim.o.list = true -- Show <tab> and trailing spaces.
    vim.opt.listchars = {tab = "» " , trail = "·",nbsp= "_"}
    vim.o.splitbelow = true
    vim.o.splitright = true
    vim.o.inccommand = 'split'  -- Preview substitutions live

    -- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
    -- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
    vim.o.confirm = true

    --
    -- KEYMAPS
    --
    -- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

    -- Use <Esc> to exit terminal mode
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

    -- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
    vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
    vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
    vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
    vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')

    vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')

    vim.keymap.set({ 'n' }, '[', 'dd P')

    vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
    vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
    vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')
    vim.keymap.set({ 'n' }, '<Esc>', '<cmd>nohlsearch<CR>')
    vim.keymap.set({ 'n' }, '<C-A-up>', '<cmd>m +1<CR>')
end
do
    -- AUTOCOMMANDS (EVENT HANDLERS)
    --
    -- Highlight when yanking (copying) text.
    vim.api.nvim_create_autocmd('TextYankPost', {
      desc = 'Highlight when yanking (copying) text',
      callback = function()
        vim.hl.on_yank()
      end,
    })

    -- USER COMMANDS: DEFINE CUSTOM COMMANDS
    --
    -- See `:h nvim_create_user_command()` and `:h user-commands`

    -- Create a command `:GitBlameLine` that print the git blame for the current line
    vim.api.nvim_create_user_command('GitBlameLine', function()
      local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
      local filename = vim.api.nvim_buf_get_name(0)
      print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
    end, { desc = 'Print the git blame for the current line' })
    -- PLUGINS
    --
    -- See `:h :packadd`, `:h vim.pack`

    vim.cmd('packadd! nohlsearch') -- to stop highlight when in insert mode
    -- Install third-party plugins via "vim.pack.add()".
    vim.pack.add({
      -- Fuzzy picker
      'https://github.com/ibhagwan/fzf-lua',
      'https://github.com/stevearc/quicker.nvim',
      -- Git integration
      'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/rebelot/kanagawa.nvim',
    })
    vim.cmd.colorscheme('kanagawa')
    require('fzf-lua').setup { fzf_colors = true }
    require('quicker').setup {}
    require('gitsigns').setup {}
end

function gh(x)
    return 'https://github.com/'..x;
end
