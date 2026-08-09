# Neovim Keybindings Reference

This document provides a comprehensive reference of all keybindings configured in this Neovim setup.

## Quick Reference

**Leader Key**: `,` (comma)  
**Local Leader Key**: `,` (comma)  
**Alternative Leader**: `<Space>` for some commands

---

## Core Editor (lua/core/keymaps/editor.lua)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `kj` | i | `<esc>` | Exit insert mode |
| `<PageUp>` / `<PageDown>` | n,v | `<C-b>` / `<C-f>` | Page up/down |
| `<leader>w` | n | `<cmd>w!<CR>` | Save file |
| `<leader>ww` | n | Toggle `wrap` + `linebreak` | Toggle word wrap |
| `<Space>/` | n | `:vsplit<CR>` | Split window vertically |
| `<Space>-` | n | `:split<CR>` | Split window horizontally |
| `j` / `k` | n,x | `v:count == 0 ? 'gj' : 'j'` | Visual-line movement (better j/k) |
| `ƒ` | n | `/` | Search |
| `<leader>R` | n | `:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>` | Search and replace word under cursor |
| `<leader>r` | x | `:s/\%V` | Search and replace in visual selection |
| `<C-a>` | n,x | `gg<S-v>G` | Select all text |
| `<leader>cr` | n | Re-set `+` register | Refresh clipboard from system |
| `<c-l>` | i | `<c-g>u<Esc>[s1z=`]a<c-g>u` | Fix spelling in insert mode |
| `<Space>m` | n | `Utils.max_or_equal()` | Maximize or equalize split |
| `<M-UP>` | n | `<cmd>resize +2<cr>` | Resize pane up |
| `<M-DOWN>` | n | `<cmd>resize -2<cr>` | Resize pane down |
| `<M-LEFT>` | n | `<cmd>vertical resize +2<cr>` | Resize pane left |
| `<M-RIGHT>` | n | `<cmd>vertical resize -2<cr>` | Resize pane right |
| `<c-k>` | n | `:m -2<CR>==` | Move line up |
| `<c-j>` | n | `:m +1<CR>==` | Move line down |
| `<c-k>` | v | `:m '<-2<CR>gv=gv` | Move selection up |
| `<c-j>` | v | `:m '>+1<CR>gv=gv` | Move selection down |
| `<` / `>` | v | `<gv` / `>gv` | Indent and reselect |
| `p` | v | `"_dP` | Paste without yanking |
| `p` | x | `P` | Paste |
| `dD` | n | `"_dd` | Delete line without yanking |
| `c` | n,v | `"_c` | Change without yanking |
| `C` | n | `"_C` | Change to end without yanking |
| `dd` | n | `"_dd` on empty lines | Don't yank empty lines |
| `<M-i>` | i | `<Esc>I` | Jump to beginning of line |
| `<M-a>` | i | `<Esc>A` | Jump to end of line |
| `<C-b>` | i | `{},<esc>hha` | Add curly braces with comma |
| `g,` | n | `g;` | Go to newest change (swapped) |
| `g;` | n | `g,` | Go to last change (swapped) |
| `<esc>` | i,n | `<cmd>noh<cr><esc>` | Escape and clear search highlight |
| `<leader>fn` | n | `<cmd>enew<cr>` | New file |
| `i` | n | `"_cc` on empty lines | Better `i` on empty lines |
| `z.` | n | `1z=` | Fix spelling |
| `z=` | n | `vim.ui.select` suggestions | Spelling suggestions |
| `<leader>mm` | n | `<cmd>messages<cr>` | Show messages |

## Text Objects

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `iq` / `iQ` | o,x | `i'` / `i"` | Inner single/double quotes |
| `aq` / `aQ` | o,x | `2i'` / `2i"` | Around single/double quotes |
| `a'` / `a"` | o,x | `2i'` / `2i"` | Around single/double quotes (alt) |
| `ir` / `ar` | o,x | `i[` / `a[` | Inner/around brackets |

## Window & Buffer Management

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Space>h` / `<Space>l` / `<Space>k` / `<Space>j` | n | `<c-w>h/l/k/j` | Move to split pane |
| `<Space>bd` | n | `<cmd>bd<cr>` | Delete buffer |
| `<leader>bd` | n | `mini.bufremove.delete(0, false)` | Delete buffer (keep layout) |
| `<leader>bD` | n | `mini.bufremove.delete(0, true)` | Delete buffer (force) |
| `<S-Left>` | n | `<cmd>BufferLineCyclePrev<cr>` | Previous buffer |
| `<S-Right>` | n | `<cmd>BufferLineCycleNext<cr>` | Next buffer |
| `<Space>bp` | n | `<cmd>BufferLineTogglePin<cr>` | Pin buffer |
| `<Space>bk` | n | `<cmd>BufferLinePick<cr>` | Pick buffer |
| `<Space>bo` | n | `<cmd>BufferLineCloseOthers<cr>` | Close other buffers |
| `<Space>b<left>` / `<Space>b<right>` | n | BufferLineMovePrev/Next | Move buffer |
| `<Space>b1-9` | n | `<cmd>BufferLineGoToBuffer N<cr>` | Go to buffer 1-9 |
| `-` | n | `mini.pick.builtin.buffers()` | Buffer picker (mini.pick) |

## Smart Window Moves (lua/utils/window.lua)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<C-Left>` / `<C-Right>` / `<C-Up>` / `<C-Down>` | n | Smart move cursor | Move between windows (smart-splits style) |
| `<C-\>` | n | Smart move previous | Move to previous window |
| `<M-h>` / `<M-l>` / `<M-k>` / `<M-j>` | n | Smart resize | Resize window toward direction |
| `<leader><leader>h/l/k/j` | n | Swap buffer | Swap buffer to adjacent window |

## Surround (mini.surround)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `sa` | n | `sa{motion}{char}` | Add surround (e.g. `saiw(`) |
| `sd` | n | `sd{char}` | Delete surround |
| `sr` | n | `sr{old}{new}` | Replace surround |
| `sa` | x | Add around selection | Add surround around visual selection |
| `sf` / `sF` | n | Find right/left surround | Jump to surrounding pair |
| `sh` | n | Highlight surround | Highlight surrounding pair |
| `sn` | n | Update n_lines | Update lines searched for surround |

**Note**: HTML tag surround (`sa t`, `sd t`) from the old custom util is NOT available in mini.surround.

## Comments (mini.comment)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `gc` | n | Toggle comment (motion) | Comment motion (`gcw`, `gcap`) |
| `gc` | x | Toggle comment (visual) | Comment selection |
| `gcc` | n | Toggle comment line | Comment current line |

**Note**: Block comment keys (`gb`/`gbc`) do not exist in this mini.nvim version.

## Todo Comments & Markers

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>tq` | n | `<cmd>TodoQuickFix<cr>` | Todo QuickFix |
| `<leader>tl` | n | `<cmd>TodoLocList<cr>` | Todo LocList |
| `<leader>ts` | n | `<cmd>TodoTelescope<cr>` | Todo Telescope |
| `]t` | n | `require('todo-comments').jump_next()` | Next todo comment |
| `[t` | n | `require('todo-comments').jump_prev()` | Previous todo comment |
| `<leader>tc` | n | `utils/todo-marker.lua` | Toggle checkbox `[ ]` / `[x]` |
| `<leader>tt` | n | **Toggle Terminal (Snacks)** | Terminal toggle — shadows todo-marker cycle |

**Note**: `,tt` was the TODO/FIXME/HACK cycle key (todo-marker util); Snacks' terminal toggle now wins that key. The checkbox toggle (`,tc`) is unaffected.

## LSP Functions (lua/plugins/lsp/lsp-config.lua)

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
| `grwa` / `grwr` / `grwl` | n | Workspace folders | Add/remove/list workspace folders |
| `<C-S>` | i,v | `vim.lsp.buf.signature_help` | Signature help |

## Glance LSP (glance.nvim)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `gd` | n | Glance definitions | Go to definition (floating) |
| `gr` | n | Glance references | LSP references (floating) |
| `gm` | n | Glance implementations | Go to implementation |
| `gy` | n | Glance type definitions | Go to type definition |

## Code Actions (fastaction)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Space>aa` | n,v | Code actions | Open code actions menu |
| `<Space>af` | n,v | Apply first code action | Apply first available action |

## Diagnostics

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Space>d` | n | `vim.diagnostic.open_float` | Open diagnostic window |
| `<Space><left>` | n | `vim.diagnostic.jump({ count = -1 })` | Previous diagnostic |
| `<Space><right>` | n | `vim.diagnostic.jump({ count = 1 })` | Next diagnostic |
| `<Space>q` | n | `vim.diagnostic.setloclist` | Send diagnostics to loclist |
| `[d` / `]d` | n | mini.bracketed | Previous/next diagnostic (buffer) |
| `[D` / `]D` | n | mini.bracketed | First/last diagnostic (buffer) |
| `<C-W>d` / `<C-W><C-D>` | n | Show diagnostics under cursor | Diagnostic float under cursor |

## File Navigation & Search

### Snacks Picker
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

### Mini.pick
| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<C-p>` | n | `mini.pick.builtin.files()` | Find files |
| `<leader>/` | n | `mini.pick.builtin.grep_live()` | Live grep |
| `<leader>f/` | n | `mini.pick.builtin.grep()` | Grep in files |
| `-` | n | `mini.pick.builtin.buffers()` | Buffer picker |

## File Management

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Space>e` / `<Leader>e` | n | `Snacks.explorer()` | File explorer |
| `<leader>fn` | n | `<cmd>enew<cr>` | New file |

## Git Operations (lua/plugins/git.lua + misc.lua)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>gg` | n | `<cmd>Neogit<cr>` | Neogit interface |
| `<leader>do` | n | `<cmd>DiffviewOpen<cr>` | Open Diffview |
| `<leader>dc` | n | `<cmd>DiffviewClose<cr>` | Close Diffview |
| `<leader>dh` | n | `<cmd>DiffviewFileHistory<cr>` | File history |
| `<leader>df` | n | `<cmd>DiffviewToggleFiles<cr>` | Toggle file panel |
| `<leader>dv` | n | `diffview.lib` toggle | Toggle Diffview open/close |
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
| `p` / `P` | n,x | `<Plug>(YankyPutAfter/Before)` | Put (Yanky) |
| `gp` / `gP` | n,x | `<Plug>(YankyGPutAfter/Before)` | GPut (Yanky) |
| `=p` / `=P` | n,x | Put after/before with filter | Filter put |
| `>p` / `>P` | n,x | Put indent right | Indent put |
| `<lt>p` / `<lt>P` | n,x | Put indent left | Dedent put |

## Align (mini.align)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>ma` | n,x | Mini.align with preview | Align with interactive preview |
| `<leader>mA` | n,x | Mini.align without preview | Align without preview |

## Comments & Comment Boxes

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `gc` / `gcc` | n,x | mini.comment | Toggle comment (see Comments section) |
| `<leader>cb` | n | Comment Box: Section Title | Section title box |
| `<leader>ca` | n | Comment Box: Subsection Title | Subsection title box |
| `<leader>cl` | n | Comment Box: Dividing Line | Dividing line |
| `<leader>cd` | n | Comment Box: Delete | Delete comment box |
| `<leader>cf` | n | Comment Box: Single Frame | Single comment frame |
| `<leader>cm` | n | Comment Box: Multi Frame | Multi comment frame |

## Notifications

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Space>nn` | n | `Snacks.notifier.show_history()` | Notification history |
| `<Space>nc` | n | `Snacks.notifier.hide()` | Dismiss notifications |
| `<Space>nh` | n | Noice message history | Noice history |
| `<Space>nl` | n | Noice last message | Noice last message |
| `<Space>nd` | n | Dismiss Noice messages | Noice dismiss |

## Debug (DAP)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>Db` | n | `<cmd>DapToggleBreakpoint<cr>` | Add breakpoint |
| `<leader>Du` | n | `<cmd>lua require("dapui").toggle()<CR>` | DAP UI toggle |
| `<leader>dB` | n | `require("dap").set_breakpoint(input)` | Add conditional breakpoint |
| `<leader>Dc` | n | `<cmd>DapContinue<CR>` | Dap continue |
| `<leader>Dsi` | n | `<cmd>DapStepInto<CR>` | Dap step into |
| `<leader>Dso` | n | `<cmd>DapStepOver<CR>` | Dap step over |
| `<leader>Dst` | n | `<cmd>DapStepOut<CR>` | Dap step out |
| `<leader>Dt` | n | `<cmd>DapTerminate<CR>` | Dap terminate |
| `<leader>Dl` | n | `<cmd>DapShowLog<CR>` | Dap show log |
| `<leader>Dr` | n | `<cmd>DapToggleRepl<CR>` | Dap toggle REPL |

## Text Sorting & Alignment (lua/core/keymaps/misc.lua)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>so` | n,v | `:Sort<CR>` | Sort lines/selection |
| `<leader>si` | n,v | `:Sort i<CR>` | Sort (ignore case) |
| `<leader>su` | n,v | `:Sort u<CR>` | Sort (unique) |
| `<leader>sn` | n,v | `:Sort n<CR>` | Sort (numeric) |

## Trouble (Diagnostics & Lists)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Space>xx` | n | `<cmd>Trouble diagnostics toggle<cr>` | Diagnostics (Trouble) |
| `<Space>xX` | n | `<cmd>Trouble diagnostics toggle filter.buf=0<cr>` | Buffer diagnostics |
| `<Space>xs` | n | `<cmd>Trouble symbols toggle<cr>` | Symbols (Trouble) |
| `<Space>xr` | n | `<cmd>Trouble lsp toggle win.position=right<cr>` | LSP references |
| `<Space>xl` | n | `<cmd>Trouble loclist toggle<cr>` | Location list |
| `<Space>xq` | n | `<cmd>Trouble qflist toggle<cr>` | Quickfix list |
| `<Space>xt` | n | `<cmd>Trouble todo<cr>` | Todo trouble |
| `<leader>mc` | n | `<cmd>Trouble todo toggle<cr>` | Todo trouble |

## AI Integration

### CodeCompanion
| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>O` | n,v | CodeCompanion toggle | Open CodeCompanion |
| `<leader>Oa` | n,v | CodeCompanion actions | Actions menu |
| `<leader>Oc` | n,v | CodeCompanion chat | Chat |
| `<leader>Od` | n,v | CodeCompanion CMD | CMD mode |
| `<leader>OG` | n | Generate code | Generate code |
| `<leader>OM` | n,v | Modify code | Modify code |

### Ollama
| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>Os` | n | Ollama Serve | Start Ollama serve |
| `<leader>OS` | n | Ollama Serve Stop | Stop Ollama serve |
| `<leader>Om` | n | Ollama Model | Select model |
| `<leader>Oo` | n,v | Ollama Prompt | Prompt menu |
| `<leader>Oq` | n | Cancel All Jobs | Cancel Ollama jobs |

## Colors & Icons

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>Cp` | n | Color picker | Open color picker |
| `<leader>CP` | n | Color picker insert | Insert color at cursor |
| `<leader>Cc` | n | Color convert | Convert color format |
| `<leader>Cr` | n | Convert HEX to RGB | Convert |
| `<leader>Ch` | n | Convert HEX to HSL | Convert |
| `<leader>in` | n | `:Nerdy list<CR>` | Browse nerd icons |
| `<leader>iN` | n | `:Nerdy recents<CR>` | Browse recent nerd icons |

## Project Notes (project_notes.nvim)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>nt` | n | Toggle notes | Open/close note for current file |
| `<leader>nm` | n | Main note | Open main note |
| `<leader>nl` | n | List notes | List all notes |
| `<leader>nd` | n | Delete note | Delete current note |
| `<leader>ne` | n | Delete empty notes | Delete empty note files |

**Note**: Notes are stored in `.opencode/context/notes/` when the project has an `.opencode/` directory, otherwise `.documentation/notes`.

## Neovim Tips (neovim-tips)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Space>nto` | n | `:NeovimTips<CR>` | Open tips |
| `<Space>ntb` | n | `:NeovimTipsBookmarks<CR>` | Bookmarked tips |
| `<Space>ntr` | n | `:NeovimTipsRandom<CR>` | Show random tip |
| `<Space>nte` | n | `:NeovimTipsEdit<CR>` | Edit your tips |
| `<Space>nta` | n | `:NeovimTipsAdd<CR>` | Add your tip |
| `<Space>ntp` | n | `:NeovimTipsPdf<CR>` | Open tips PDF |

## Snacks Extras

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>db` | n | `Snacks.dashboard()` | Toggle dashboard |
| `<leader>bf` | n | Big file status | Show big file optimization status |
| `<leader>qf` | n | Quick file actions | Quick file action menu |
| `<leader>sc` | n | Toggle scope | Toggle scope highlight |
| `<leader>st` | n | Toggle status column | Toggle status column |
| `<leader>tt` | n | Toggle terminal | Toggle floating terminal |
| `<leader>pp` | n | `Snacks.image.clear()` | Clear images |

## Mini.visits (Path Selection)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>vv` | n | Select recent path | Pick from visited paths |
| `<leader>vr` | n | Select recent path | Recent filter |
| `<leader>vf` | n | Select frequent path | Frequent filter |
| `<leader>vc` | n | Select path in cwd | Current directory filter |

## LSP Tooling

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<leader>lm` | n | `<cmd>Mason<cr>` | Mason LSP manager |
| `<leader>lS` | n | `<cmd>Symbols<cr>` | LSP symbols sidebar |
| `<Space>o` | n | `<cmd>Outline<cr>` | Toggle outline |

## Snippets

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Tab>` | i,s | `vim.snippet.jump` | Jump to next snippet field |
| `<S-Tab>` | i,s | `vim.snippet.jump(-1)` | Jump to previous field |
| `<leader>sa` | n | Scissors: Add | Add snippet |
| `<leader>se` | n | Scissors: Edit | Edit snippet |

**Note**: LuaSnip's `<C-i>`/`<C-Up>`/`<C-Down>`/`<C-Shift-o>` keys are gone — snippet jumping is handled by native `vim.snippet`.

## Treesitter

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `m` | o,x | `require('tsht').nodes()` | Treehopper: select TS nodes |
| `]n` / `[n` | x | Select next/prev node | TS node selection |
| `]N` / `[N` | x | Select next/prev sibling | TS sibling selection |
| `in` / `an` | x | Select child / parent node | TS node text objects |
| `<leader>ct` | n | `<cmd>TSContextToggle<cr>` | Toggle treesitter context |

## Miscellaneous

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<Leader>la` | n | `<cmd>Lazy<cr>` | Open Lazy |
| `<Leader>lc` | n | `<cmd>Lazy clean<cr>` | Clean Lazy plugins |
| `<Leader>lC` | n | `<cmd>Lazy check<cr>` | Check Lazy plugins |
| `<Leader>ls` | n | `<cmd>Lazy sync<cr>` | Sync Lazy plugins |
| `gx` | n | Open filepath/URI | Open under cursor with system handler |
| `z.` | n | `1z=` | Fix spelling |
| `z=` | n | Spelling suggestions via vim.ui.select | Spelling suggestions |

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

## Completion (blink.cmp)

| Key | Mode | Function | Description |
|-----|------|----------|-------------|
| `<C-n>` | i | Select next item | Next completion item |
| `<C-p>` | i | Select previous item | Previous completion item |
| `<C-u>` | i | Scroll docs up | Scroll documentation up |
| `<C-d>` | i | Scroll docs down | Scroll documentation down |
| `<C-Space>` | i | Complete | Trigger completion |
| `<C-e>` | i | Abort | Close completion |
| `<CR>` | i | Confirm selection | Accept completion |
| `<Tab>` | i,s | Smart tab completion | Tab/snippet navigation |
| `<S-Tab>` | i,s | Smart shift-tab | Previous completion/snippet |

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
5. Keymap sources: core keymaps live in `lua/core/keymaps/` (editor.lua = EDITOR/UI/IMAGE, misc.lua = DEBUG/GIT/SORT); plugin keymaps live in their plugin files under `lua/plugins/`

---

*Last Updated*: 2026-08-08  
*Total Keybindings*: 200+  
*Leader Key*: `,` (comma)
