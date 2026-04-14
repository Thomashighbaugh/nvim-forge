# Neovim Keybindings Reference

This document provides a comprehensive reference of all keybindings configured in this Neovim setup.

## Quick Reference

**Leader Key**: `,` (comma)  
**Local Leader Key**: `,` (comma)  
**Alternative Leader**: `<Space>` for some commands

---

## Core Navigation & Basic Operations

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `kj` | i | `<esc>` | Exit insert mode |
| `<leader>w` | n | `<cmd>w!<CR>` | Save file |
| `<Space>/` | n | `:vsplit<CR>` | Split window vertically |
| `<Space>-` | n | `:split<CR>` | Split window horizontally |
| `j` | n,x | `v:count == 0 ? 'gj' : 'j'` | Better up movement (visual lines) |
| `k` | n,x | `v:count == 0 ? 'gk' : 'k'` | Better down movement (visual lines) |
| `<C-a>` | n,x | `gg<S-v>G` | Select all text |
| `<esc>` | i,n | `<cmd>noh<cr><esc>` | Escape and clear search highlight |

## Search & Replace

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `ƒ` | n | `/` | Search |
| `<leader>R` | n | `:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>` | Search and replace word under cursor |
| `<leader>r` | x | `:s/\%V` | Search and replace in visual selection |

## Window & Buffer Management

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Space>bd` | n | `<cmd>bd<cr>` | Delete buffer |
| `<Space>h` | n | `<c-w>h` | Move to left split pane |
| `<Space>l` | n | `<c-w>l` | Move to right split pane |
| `<Space>k` | n | `<c-w>k` | Move to upper split pane |
| `<Space>j` | n | `<c-w>j` | Move to lower split pane |
| `<Space>m` | n | `Utils.max_or_equal()` | Maximize or equalize split |
| `<S-Left>` | n | `<cmd>BufferLineCyclePrev<cr>` | Previous buffer |
| `<S-Right>` | n | `<cmd>BufferLineCycleNext<cr>` | Next buffer |
| `<space>bp` | n | `<cmd>BufferLineTogglePin<cr>` | Pin buffer |
| `<space>bk` | n | `<cmd>BufferLinePick<cr>` | Pick buffer |
| `<space>bo` | n | `<cmd>BufferLineCloseOthers<cr>` | Close other buffers |
| `<space>b<left>` | n | `<cmd>BufferLineMovePrev<cr>` | Move buffer left |
| `<space>b<right>` | n | `<cmd>BufferLineMoveNext<cr>` | Move buffer right |
| `<space>b1-9` | n | `<cmd>BufferLineGoToBuffer N<cr>` | Go to buffer N (1-9) |

## Window Resizing

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<M-UP>` | n | `<cmd>resize +2<cr>` | Resize pane up |
| `<M-DOWN>` | n | `<cmd>resize -2<cr>` | Resize pane down |
| `<M-LEFT>` | n | `<cmd>vertical resize +2<cr>` | Resize pane left |
| `<M-RIGHT>` | n | `<cmd>vertical resize -2<cr>` | Resize pane right |

## Smart Splits (Advanced Window Management)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<A-h>` | n | Smart resize left | Smart resize left |
| `<A-j>` | n | Smart resize down | Smart resize down |
| `<A-k>` | n | Smart resize up | Smart resize up |
| `<A-l>` | n | Smart resize right | Smart resize right |
| `<C-Left>` | n | Smart move cursor left | Smart move cursor left |
| `<C-Down>` | n | Smart move cursor down | Smart move cursor down |
| `<C-Up>` | n | Smart move cursor up | Smart move cursor up |
| `<C-Right>` | n | Smart move cursor right | Smart move cursor right |
| `<C-\>` | n | Smart move to previous | Smart move to previous |
| `<leader><leader>h` | n | Smart swap buffer left | Smart swap buffer left |
| `<leader><leader>j` | n | Smart swap buffer down | Smart swap buffer down |
| `<leader><leader>k` | n | Smart swap buffer up | Smart swap buffer up |
| `<leader><leader>l` | n | Smart swap buffer right | Smart swap buffer right |

## Text Editing & Movement

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<c-k>` | n | `:m -2<CR>==` | Move line up |
| `<c-j>` | n | `:m +1<CR>==` | Move line down |
| `<c-k>` | v | `:m '<-2<CR>gv=gv` | Move selection up |
| `<c-j>` | v | `:m '>+1<CR>gv=gv` | Move selection down |
| `<` | v | `<gv` | Indent left and reselect |
| `>` | v | `>gv` | Indent right and reselect |
| `p` | v | `"_dP` | Paste without yanking |
| `p` | x | `P` | Paste |
| `dD` | n | `"_dd` | Delete line without yanking |
| `c` | n,v | `"_c` | Change without yanking |
| `C` | n | `"_C` | Change to end without yanking |

## Insert Mode Helpers

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<M-i>` | i | `<Esc>I` | Jump to beginning of line |
| `<M-a>` | i | `<Esc>A` | Jump to end of line |
| `<c-l>` | i | `<c-g>u<Esc>[s1z=`]a<c-g>u` | Fix spelling in insert mode |
| `<C-b>` | i | `{},<esc>hha` | Add curly braces with comma |

## Text Objects

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `iq` | o,x | `i'` | Inner single quotes |
| `iQ` | o,x | `i"` | Inner double quotes |
| `aq` | o,x | `2i'` | Around single quotes |
| `aQ` | o,x | `2i"` | Around double quotes |
| `ir` | o,x | `i[` | Inner brackets |
| `ar` | o,x | `a[` | Around brackets |

## LSP Functions

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `K` | n | `vim.lsp.buf.hover` | Show hover info |
| `gra` | n,v | `vim.lsp.buf.code_action` | Code action |
| `<M-CR>` | n,v | `vim.lsp.buf.code_action` | Code action |
| `grn` | n | `vim.lsp.buf.rename` | LSP rename |
| `grr` | n | `vim.lsp.buf.references` | LSP references |
| `grd` | n | `vim.lsp.buf.definition` | Go to definition |
| `grD` | n | `vim.lsp.buf.declaration` | Go to declaration |
| `gri` | n | `vim.lsp.buf.implementation` | Go to implementation |
| `grf` | n | `vim.lsp.buf.format` | Format document |
| `grk` | n | `vim.lsp.buf.signature_help` | Signature help |
| `grs` | n | `vim.lsp.buf.document_symbol` | Document symbols |
| `grt` | n | `vim.lsp.buf.type_definition` | Type definition |

## LSP Workspace

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `grwa` | n | `vim.lsp.buf.add_workspace_folder` | Add workspace folder |
| `grwr` | n | `vim.lsp.buf.remove_workspace_folder` | Remove workspace folder |
| `grwl` | n | List workspace folders | List workspace folders |

## Diagnostics

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<space>d` | n | `vim.diagnostic.open_float` | Open diagnostic window |
| `<space><left>` | n | `vim.diagnostic.jump({ count = -1 })` | Previous diagnostic |
| `<space><right>` | n | `vim.diagnostic.jump({ count = 1 })` | Next diagnostic |
| `<space>q` | n | `vim.diagnostic.setloclist` | Send diagnostics to loclist |
| `<Space>ih` | n | Toggle inlay hints | Toggle inlay hints |

## File Navigation & Search (Snacks Picker)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>fb` | n | `Snacks.picker.buffers()` | Find buffers |
| `<leader>fc` | n | `Snacks.picker.commands()` | List commands |
| `<leader>fd` | n | `Snacks.picker.diagnostics()` | Find diagnostics |
| `<leader>ff` | n | `Snacks.picker.files()` | Find files |
| `<leader>fg` | n | `Snacks.picker.grep()` | Find word (grep) |
| `<leader>fh` | n | `Snacks.picker.help()` | Find help |
| `<leader>fk` | n | `Snacks.picker.keymaps()` | Find keymaps |
| `<leader>fl` | n | `Snacks.picker.highlights()` | Find highlights |
| `<leader>fo` | n | `Snacks.picker.recent()` | Recently opened files |
| `<leader>fr` | n | `Snacks.picker.grep_word()` | Find word under cursor |
| `<leader>ft` | n | `Snacks.picker.git_files()` | Find git files |
| `<leader>?` | n | `Snacks.picker.keymaps()` | Cheatsheet (keymaps) |

## File Management

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Space>e` | n | `Snacks.explorer()` | File explorer |
| `<Leader>e` | n | `Snacks.explorer()` | File explorer |
| `<leader>fn` | n | `<cmd>enew<cr>` | New file |

## Git Operations

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>gg` | n | `<cmd>Neogit<cr>` | Neogit interface |
| `<leader>do` | n | `<cmd>DiffviewOpen<cr>` | Open Diffview |
| `<leader>dc` | n | `<cmd>DiffviewClose<cr>` | Close Diffview |
| `<leader>dh` | n | `<cmd>DiffviewFileHistory<cr>` | File history |
| `<leader>df` | n | `<cmd>DiffviewToggleFiles<cr>` | Toggle file panel |
| `<leader>gn` | n | `gs.next_hunk()` | Next git hunk |
| `<leader>gN` | n | `gs.prev_hunk()` | Previous git hunk |
| `<leader>gs` | n,v | `gs.stage_hunk` | Stage hunk |
| `<leader>gr` | n,v | `gs.reset_hunk` | Reset hunk |
| `<leader>gS` | n | `gs.stage_buffer` | Stage buffer |
| `<leader>gu` | n | `gs.undo_stage_hunk` | Undo stage hunk |
| `<leader>gR` | n | `gs.reset_buffer` | Reset buffer |
| `<leader>gp` | n | `gs.preview_hunk` | Preview hunk |
| `<leader>gB` | n | `gs.blame_line({ full = true })` | Full blame line |
| `<leader>gb` | n | `gs.toggle_current_line_blame` | Toggle line blame |
| `<leader>gd` | n | `gs.diffthis` | Diff this |
| `<leader>gD` | n | `gs.diffthis('~')` | Diff this against HEAD |
| `<leader>gt` | n | `gs.toggle_deleted` | Toggle deleted lines |
| `ih` | o,x | `:<C-U>Gitsigns select_hunk<CR>` | Git hunk text object |

## Flash Motion Navigation

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `s` | n,x,o | `require('flash').jump()` | Flash jump |
| `<leader>s` | n,o,x | `require('flash').treesitter()` | Flash treesitter |
| `r` | o | `require('flash').remote()` | Remote flash |
| `<Space>v` | n,o,x | `require('flash').treesitter_search()` | Treesitter flash search |
| `<c-s>` | c | `require('flash').toggle()` | Toggle flash search |

## Yanky (Enhanced Yank/Paste)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>y` | n,x | `<cmd>YankyRingHistory<cr>` | Yank ring history |
| `y` | n,x | `<Plug>(YankyYank)` | Yank (Yanky) |
| `p` | n,x | `<Plug>(YankyPutAfter)` | Put after (Yanky) |
| `P` | n,x | `<Plug>(YankyPutBefore)` | Put before (Yanky) |
| `gp` | n,x | `<Plug>(YankyGPutAfter)` | GPut after (Yanky) |
| `gP` | n,x | `<Plug>(YankyGPutBefore)` | GPut before (Yanky) |

## Comments

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `gc` | v | Comment visual selection | Comment visual selection |
| `gb` | v | Block comment visual | Block comment visual |
| `gcc` | n | Comment line | Comment line |
| `gbc` | n | Block comment line | Block comment line |
| `gco` | n | Comment below | Comment below |
| `gcO` | n | Comment above | Comment above |
| `gcA` | n | Comment end of line | Comment end of line |
| `<leader>mt` | n | Toggle todo marker | Toggle todo marker |

## Todo Comments

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>tq` | n | `<cmd>TodoQuickFix<cr>` | Todo QuickFix |
| `<leader>tl` | n | `<cmd>TodoLocList<cr>` | Todo LocList |
| `<leader>ts` | n | `<cmd>TodoTelescope<cr>` | Todo Telescope |
| `]t` | n | `require('todo-comments').jump_next()` | Next todo comment |
| `[t` | n | `require('todo-comments').jump_prev()` | Previous todo comment |

## Trouble (Diagnostics & Lists)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<space>xx` | n | `<cmd>Trouble diagnostics toggle<cr>` | Diagnostics (Trouble) |
| `<space>xX` | n | `<cmd>Trouble diagnostics toggle filter.buf=0<cr>` | Buffer diagnostics (Trouble) |
| `<space>xs` | n | `<cmd>Trouble symbols toggle<cr>` | Symbols (Trouble) |
| `<space>xr` | n | `<cmd>Trouble lsp toggle win.position=right<cr>` | LSP references (Trouble) |
| `<space>xl` | n | `<cmd>Trouble loclist toggle<cr>` | Location list (Trouble) |
| `<space>xq` | n | `<cmd>Trouble qflist toggle<cr>` | Quickfix list (Trouble) |
| `<space>xt` | n | `<cmd>Trouble todo<cr>` | Todo trouble |
| `<leader>mc` | n | `<cmd>Trouble todo toggle<cr>` | Todo trouble |

## Notifications (Snacks)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<space>nd` | n | `Snacks.notifier.hide()` | Dismiss all notifications |
| `<space>nh` | n | `<cmd>NotificationHistory<cr>` | Show notification history |
| `<space>nl` | n | `<cmd>NotificationLast<cr>` | Show last notification |
| `<space>nc` | n | `<cmd>NotificationClear<cr>` | Clear notification history |

## Debug (DAP)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>Db` | n | `<cmd>DapToggleBreakpoint<cr>` | Add breakpoint |
| `<leader>Du` | n | `<cmd>lua require("dapui").toggle()<CR>` | DAP UI toggle |
| `<leader>dB` | n | Set conditional breakpoint | Add conditional breakpoint |
| `<leader>dc` | n | `<cmd>DapContinue<CR>` | Dap continue |
| `<leader>dsi` | n | `<cmd>DapStepInto<CR>` | Dap step into |
| `<leader>dso` | n | `<cmd>DapStepOver<CR>` | Dap step over |
| `<leader>dst` | n | `<cmd>DapStepOut<CR>` | Dap step out |
| `<leader>dt` | n | `<cmd>DapTerminate<CR>` | Dap terminate |
| `<leader>dl` | n | `<cmd>DapShowLog<CR>` | Dap show log |
| `<leader>dr` | n | `<cmd>DapToggleRepl<CR>` | Dap toggle REPL |

## Text Sorting & Alignment

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>so` | n,v | `<cmd>Sort<CR>` | Sort lines/selection |
| `<leader>si` | n,v | `<cmd>Sort i<CR>` | Sort lines/selection (ignore case) |
| `<leader>su` | n,v | `<cmd>Sort u<CR>` | Sort lines/selection (unique) |
| `<leader>sn` | n,v | `<cmd>Sort n<CR>` | Sort lines/selection (numeric) |
| `<leader>ma` | n,x | Mini.align with preview | Align text with interactive preview |
| `<leader>mA` | n,x | Mini.align without preview | Align text without preview |

## AI Integration

| Key | Mode | Function | Description |
|-----|------|----------|-------------|

## Avante AI (Ask Functions)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>Oaa` | n,v | Avante ask | Avante ask |
| `<leader>Oae` | n,v | Avante edit | Avante edit |
| `<leader>Oar` | n,v | Avante refresh | Avante refresh |
| `<leader>Oaf` | n,v | Avante focus | Avante focus |
| `<leader>Oat` | n,v | Avante toggle | Avante toggle |
| `<leader>Oag` | n,v | Grammar correction (ask) | Grammar correction (ask) |
| `<leader>Oak` | n,v | Keywords (ask) | Keywords (ask) |
| `<leader>Oal` | n,v | Code readability analysis (ask) | Code readability analysis (ask) |
| `<leader>Oao` | n,v | Optimize code (ask) | Optimize code (ask) |
| `<leader>Oam` | n,v | Summarize text (ask) | Summarize text (ask) |
| `<leader>Oan` | n,v | Translate text (ask) | Translate text (ask) |
| `<leader>Oax` | n,v | Explain code (ask) | Explain code (ask) |
| `<leader>Oac` | n,v | Complete code (ask) | Complete code (ask) |
| `<leader>Oad` | n,v | Docstring (ask) | Docstring (ask) |
| `<leader>Oab` | n,v | Fix bugs (ask) | Fix bugs (ask) |
| `<leader>Oau` | n,v | Add tests (ask) | Add tests (ask) |

## Avante AI (Edit Functions)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>OaG` | v | Grammar correction (edit) | Grammar correction (edit) |
| `<leader>OaK` | v | Keywords (edit) | Keywords (edit) |
| `<leader>OaO` | v | Optimize code (edit) | Optimize code (edit) |
| `<leader>OaC` | v | Complete code (edit) | Complete code (edit) |
| `<leader>OaD` | v | Docstring (edit) | Docstring (edit) |
| `<leader>OaB` | v | Fix bugs (edit) | Fix bugs (edit) |
| `<leader>OaU` | v | Add tests (edit) | Add tests (edit) |

## Utility Features

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `-` | n | `require('snipe').open_buffer_menu()` | Open Snipe buffer menu |
| `<leader>w` | n,v | Toggle boolean value | Toggle word/boolean value |
| `<space>ir` | n | `:IncRename ` | Incremental rename |
| `<space>o` | n | `<cmd>Outline<cr>` | Toggle outline |
| `<leader>cr` | n | Refresh clipboard | Refresh clipboard from system |

## Colors & Icons

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>Cp` | n | `<cmd>CPicker<cr>` | Color picker |
| `<leader>Cs` | n | `<cmd>CPicker<cr>` | Color shades |
| `<leader>Ch` | n | `<cmd>CPicker<cr>` | Color huefy |
| `<leader>in` | n | `:Nerdy list<CR>` | Browse nerd icons |
| `<leader>iN` | n | `:Nerdy recents<CR>` | Browse recent nerd icons |

## Miscellaneous

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Leader>la` | n | `<cmd>Lazy<cr>` | Open Lazy |
| `<Leader>lc` | n | `<cmd>Lazy clean<cr>` | Clean Lazy plugins |
| `<Leader>lC` | n | `<cmd>Lazy check<cr>` | Check Lazy plugins |
| `<Leader>ls` | n | `<cmd>Lazy sync<cr>` | Sync Lazy plugins |
| `<leader>mm` | n | `<cmd>messages<cr>` | Show messages |
| `<leader>ct` | n | `<cmd>TSContextToggle<cr>` | Toggle treesitter context |
| `z.` | n | `1z=` | Fix spelling |
| `z=` | n | Spelling suggestions via vim.ui.select | Spelling suggestions |
| `g,` | n | `g;` | Go to newest change |
| `g;` | n | `g,` | Go to last change |

## Terminal Mode

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<esc>` | t | `<C-\><C-n>` | Exit terminal mode |
| `kj` | t | `<C-\><C-n>` | Exit terminal mode |
| `<C-h>` | t | `<Cmd>wincmd h<CR>` | Move to left window |
| `<C-j>` | t | `<Cmd>wincmd j<CR>` | Move to down window |
| `<C-k>` | t | `<Cmd>wincmd k<CR>` | Move to up window |
| `<C-l>` | t | `<Cmd>wincmd l<CR>` | Move to right window |
| `<C-w>` | t | `<C-\><C-n><C-w>` | Window command prefix |

## Buffer-Specific (Auto-Commands)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `q` | n | `<cmd>bd<cr>` | Quit help/qf/man/query buffers |
| `q` | n | `<cmd>tabc<cr>` | Quit DiffView/checkhealth tabs |

## Completion (CMP)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<C-n>` | i | Select next item | Next completion item |
| `<C-p>` | i | Select previous item | Previous completion item |
| `<C-u>` | i | Scroll docs up | Scroll documentation up |
| `<C-d>` | i | Scroll docs down | Scroll documentation down |
| `<C-Space>` | i | Complete | Trigger completion |
| `<C-e>` | i | Abort | Close completion |
| `<CR>` | i | Confirm selection | Accept completion |
| `<Tab>` | i,s | Smart tab completion | Tab/snippet/copilot navigation |
| `<S-Tab>` | i,s | Smart shift-tab | Previous completion/snippet |

## Snippets (LuaSnip)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<C-i>` | i,s | Expand or jump forward | Snippet expand/next |
| `<C-Up>` | i,s | Jump to next choice | Next snippet choice |
| `<C-Down>` | i,s | Jump to previous choice | Previous snippet choice |
| `<C-Shift-o>` | i,s | Change choice | Change snippet choice |

---

## Mode Legend

- **n** = Normal mode
- **i** = Insert mode  
- **v** = Visual mode
- **x** = Visual block mode
- **s** = Select mode
- **o** = Operator-pending mode
- **t** = Terminal mode
- **c** = Command-line mode

## Tips

1. Use `<leader>?` to see a live keymaps picker with search
2. Use `<leader>fk` to search through all keymaps
3. Many plugins have their own `:help` documentation for additional keybindings
4. Buffer-specific keymaps are created dynamically based on file type

---

*Last Updated*: 2026-04-13  
*Total Keybindings*: 200+  
*Leader Key*: `,` (comma)