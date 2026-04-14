# Neovim Forge

My [Winchester Mystery](https://en.wikipedia.org/wiki/Winchester_Mystery_House) Neovim Configuration, using `lazy.nvim`

> **Warning**
> This is my personal configuration, subject to experimentation
> and radical rewrites periodically, rebases or substantially modifications
> without prior warning and other things that may make this unstable for you
> to use as it is presented.

With this in mind, **feel free to take from it as you please**, use pieces of
it or the whole thing as a basis for your own, and you are more than welcome
to **submit pull requests** if it so pleases you, that's why its on
GitHub |wink|

## Installation

To use this configuration, clone or copy it directly into your `~/.config/nvim` directory.

```sh

# Back up your old configuration if present
mv ~/.config/nim ~/.config/nvim.bak

# Now clone this one
git clone https://github.com/Thomashighbaugh/nvim-forge ~/.config/nvim

```

And that _should_ be it, if you have the prerequisites installed it should run through the lazy.nvim installation process and handle setting up everything in the process from Treesitter grammars to Mason dependencies, it might just take a few minutes so be patient.

## Configuration Structure

This configuration roughly follows that of LazyVim, with some minor changes that are mostly due to personal taste, which while arbitrary is much easier to quickly locate various things when they are arranged in the way one prefers and not an artificially imposed standard. The lion's share of the configuration exists within the `lua/` subdirectory as is the convention of Lua-based NeoVim configurations.

Unlike many other highly customized NeoVim configurations, as well as most major configuration frameworks, the configuration is not nested within a subdirectory of the Lua subdirectory named after the author, plugin or configuration, I find no need to brand this configuration in a way that makes using its parts elsewhere highly onerous and introduces a needless source of potential errors for me to deal with instead of working on code like I intend to be.

Below is a representation of the structure of the configuration in tree format

 .
├──  Dockerfile
├──  ftplugin
│ └──  java.lua
├──  init.lua
├──  lazy-lock.json
├──  lua
│ ├──  code_action_utils.lua
│ ├──  core
│ │ ├──  autocommands.lua
│ │ ├──  keymaps.lua
│ │ ├──  options.lua
│ │ ├──  usercommands.lua
│ │ └──  utils.lua
│ └──  plugins
│ ├──  aisync.lua
│ ├──  bufferline.lua
│ ├──  cmp.lua
│ ├──  codesnap.lua
│ ├──  comments.lua
│ ├──  conform.lua
│ ├──  dap
│ │ └──  debug_adapter.lua
│ ├──  dashboard.lua
│ ├──  devdocs.lua
│ ├──  dressing.lua
│ ├──  flash.lua
│ ├──  focus.lua
│ ├──  git.lua
│ ├──  image_preview.lua
│ ├──  inc_rename.lua
│ ├──  indent-blankline.lua
│ ├──  init.lua
│ ├──  lsp
│ │ ├──  aerial.lua
│ │ ├──  glance.lua
│ │ ├──  lazydev.lua
│ │ ├──  lsp-config.lua
│ │ ├──  mason.lua
│ │ ├──  nvim-navic.lua
│ │ ├──  outline.lua
│ │ └──  trouble.lua
│ ├──  lualine.lua
│ ├──  luasnip.lua
│ ├──  mini-align.lua
│ ├──  mini-indentscope.lua
│ ├──  neo-tree.lua
│ ├──  noice.lua
│ ├──  nvim-autopairs.lua
│ ├──  nvim-lint.lua
│ ├──  nvim-notify.lua
│ ├──  nvim-surround.lua
│ ├──  nvim-tree.lua
│ ├──  oil.lua
│ ├──  ollama.lua
│ ├──  rainbow-delimiters.lua
│ ├──  rest.lua
│ ├──  snipe.lua
│ ├──  ssr.lua
│ ├──  statuscol.lua
│ ├──  symbols.lua
│ ├──  telescope.lua
│ ├──  toggleterm.lua
│ ├──  treesitter.lua
│ ├──  web_devicons.lua
│ ├──  which-key.lua
│ └──  yanky.lua
├── 󰂺 README.md → .github/README.md
├──  snippets
│ ├──  all.lua
│ ├──  java.snippets
│ ├──  javascript.lua
│ ├──  lua.lua
│ ├──  markdown.lua
│ ├──  package.json
│ ├──  vscode
│ │ ├──  c.json
│ │ ├──  cpp.json
│ │ ├──  css.json
│ │ ├──  frameworks
│ │ │ ├──  ejs.json
│ │ │ ├──  flutter.json
│ │ │ ├──  jekyll.json
│ │ │ └──  vue
│ │ │ ├──  html.json
│ │ │ ├──  javascript.json
│ │ │ ├──  pug.json
│ │ │ └──  vue.json
│ │ ├──  gdscript.json
│ │ ├──  gitcommit.json
│ │ ├──  global.json
│ │ ├──  glsl.json
│ │ ├──  go.json
│ │ ├──  haskell.json
│ │ ├──  html.json
│ │ ├──  java.json
│ │ ├──  javascript
│ │ │ ├──  javascript.json
│ │ │ ├──  react-native-ts.json
│ │ │ ├──  react-native.json
│ │ │ ├──  react-ts.json
│ │ │ ├──  react.json
│ │ │ └──  typescript.json
│ │ ├──  kotlin.json
│ │ ├──  kubernetes.json
│ │ ├──  latex
│ │ │ ├──  latex-snippets.json
│ │ │ └──  vscode-latex-snippets.json
│ │ ├──  latex.json
│ │ ├──  lua.json
│ │ ├──  markdown.json
│ │ ├──  meson.json
│ │ ├──  norg.json
│ │ ├──  org.json
│ │ ├──  package-lock.json
│ │ ├──  package.json
│ │ ├──  python
│ │ │ ├──  base.json
│ │ │ ├──  comprehension.json
│ │ │ ├──  debug.json
│ │ │ ├──  python.json
│ │ │ └──  unittest.json
│ │ ├──  rust.json
│ │ ├──  scala.json
│ │ ├──  shell.json
│ │ └──  sql.json
│ └──  yaml.lua
└──  spell
├──  en.dict
├──  en.utf-8.add
└──  en.utf-8.add.spl

## Keybindings

Below are the keybind mappings used in this configuration, they are subject to change and are not exhaustive, but they should give you a good idea of how the configuration is set up and how to use it.

### General Keybindings

> [!] Note:
>
> -     means press both keys at the same time
>   → means first the key on the left then the key on the right

### Basic Navigation and Editing

| Keys                              | Mode          | Description                 |
| --------------------------------- | ------------- | --------------------------- |
| <kbd>j/k</kbd>                    | Normal/Visual | _Better_ Up/Down            |
| <kbd>/</kbd>                      | Normal        | Search                      |
| <kbd>g,</kbd>                     | Normal        | Go to the newest change     |
| <kbd>g;</kbd>                     | Normal        | Go to last change           |
| <kbd>i</kbd>                      | Normal        | _Better_ Insert             |
| <kbd>,</kbd> → <kbd>w</kbd>       | Normal        | Save                        |
| <kbd>Alt</kbd> + <kbd>Enter</kbd> | Normal        | List suggested code actions |

### Text Manipulation

| Keys                               | Mode            | Description                        |
| ---------------------------------- | --------------- | ---------------------------------- |
| <kbd>Ctrl</kbd> + <kbd>k</kbd>     | Normal          | Move line up                       |
| <kbd>Ctrl</kbd> + <kbd>j</kbd>     | Normal          | Move line down                     |
| <kbd>Ctrl</kbd> + <kbd>k</kbd>     | Visual          | Move line up visual                |
| <kbd>Ctrl</kbd> + <kbd>j</kbd>     | Visual          | Move line down visual              |
| <kbd><</kbd>                       | Visual          | Unindent lines in visual selection |
| <kbd>></kbd>                       | Visual          | Indent lines in visual selection   |
| <kbd>p</kbd>                       | Visual          | Paste without yanking              |
| <kbd>p</kbd>                       | Select(x)       | Paste without yanking              |
| <kbd>c</kbd>                       | Normal/Visual   | Change without yanking             |
| <kbd>C</kbd>                       | Normal          | Change line without yanking        |
| <kbd>Space</kbd> + <kbd>Up</kbd>   | Normal          | Add blank line below               |
| <kbd>Space</kbd> + <kbd>Down</kbd> | Normal          | Add blank line below               |
| <kbd>Ctrl</kbd> + <kbd>,</kbd>     | Insert          | Add comma after character          |
| <kbd>Ctrl</kbd> + <kbd>b</kbd>     | Insert          | Add curly with comma {},           |
| <kbd>i</kbd> + <kbd>q</kbd>        | Operator/Visual | Inner Single Quotes                |
| <kbd>i</kbd> + <kbd>Q</kbd>        | Operator/Visual | Inner Double Quotes                |
| <kbd>a</kbd> + <kbd>q</kbd>        | Operator/Visual | Around Single Quotes               |
| <kbd>a</kbd> + <kbd>Q</kbd>        | Operator/Visual | Around Double Quotes               |
| <kbd>a</kbd> + <kbd>'</kbd>        | Operator/Visual | Around Single Quotes               |
| <kbd>a</kbd> + <kbd>"</kbd>        | Operator/Visual | Around Double Quotes               |
| <kbd>i</kbd> + <kbd>r</kbd>        | Operator/Visual | Inner Brackets                     |
| <kbd>a</kbd> + <kbd>r</kbd>        | Operator/Visual | Inner Brackets                     |

### Buffer Management

| Keys                                               | Mode   | Description          |
| -------------------------------------------------- | ------ | -------------------- |
| <kbd>,</kbd> → <kbd>b</kbd> → <kbd>d</kbd>         | Normal | Delete Buffer        |
| <kbd>Leader</kbd> → <kbd>f</kbd> → <kbd>n</kbd>    | Normal | New File             |
| <kbd>Shift</kbd> + <kbd>Left</kbd>                 | Normal | Buffer Previous      |
| <kbd>Shift</kbd> + <kbd>Right</kbd>                | Normal | Buffer Next          |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>p</kbd>     | Normal | Pin Buffer           |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>k</kbd>     | Normal | Pick Buffer          |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>o</kbd>     | Normal | Close Other Buffers  |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>Left</kbd>  | Normal | Move Buffer to Left  |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>Right</kbd> | Normal | Move Buffer to Right |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>1</kbd>     | Normal | Go to Buffer 1       |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>2</kbd>     | Normal | Go to Buffer 2       |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>3</kbd>     | Normal | Go to Buffer 3       |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>4</kbd>     | Normal | Go to Buffer 4       |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>5</kbd>     | Normal | Go to Buffer 5       |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>6</kbd>     | Normal | Go to Buffer 6       |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>7</kbd>     | Normal | Go to Buffer 7       |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>8</kbd>     | Normal | Go to Buffer 8       |
| <kbd>Space</kbd> → <kbd>b</kbd> → <kbd>9</kbd>     | Normal | Go to Buffer 9       |

### Window Management

| Keys                                  | Mode   | Description                         |
| ------------------------------------- | ------ | ----------------------------------- |
| <kbd>Space</kbd> → <kbd>\\</kbd>      | Normal | Split Window Vertically             |
| <kbd>Space</kbd> → <kbd>/</kbd>       | Normal | Split Window Vertically             |
| <kbd>Space</kbd> → <kbd>h/l/k/j</kbd> | Normal | Move split panes Left/Right/Up/Down |
| <kbd>Space</kbd> → <kbd>m</kbd>       | Normal | Equalize split panes                |
| <kbd>Alt</kbd> + <kbd>Up</kbd>        | Normal | Resize pane up                      |
| <kbd>Alt</kbd> + <kbd>Down</kbd>      | Normal | Resize pane down                    |
| <kbd>Alt</kbd> + <kbd>Left</kbd>      | Normal | Resize pane left                    |
| <kbd>Alt</kbd> + <kbd>Right</kbd>     | Normal | Resize pane right                   |

### Search and Replace

| Keys                        | Mode   | Description                              |
| --------------------------- | ------ | ---------------------------------------- |
| <kbd>,</kbd> → <kbd>R</kbd> | Normal | Search and Replace the word under cursor |
| <kbd>,</kbd> → <kbd>r</kbd> | Normal | Search and replace in visual selection   |

### Selection and Deletion

| Keys                              | Mode   | Description                         |
| --------------------------------- | ------ | ----------------------------------- |
| <kbd>Control</kbd> + <kbd>a</kbd> | Normal | Select All                          |
| <kbd>d</kbd> + <kbd>D</kbd>       | Normal | Delete current line without yanking |
| <kbd>d</kbd> + <kbd>d</kbd>       | Normal | Yank non-empty lines                |

### Insert Mode

| Keys                              | Mode   | Description                           |
| --------------------------------- | ------ | ------------------------------------- |
| <kbd>Escape</kbd>                 | Insert | Exit Insert Mode                      |
| <kbd>Control</kbd> + <kbd>l</kbd> | Insert | Correct Word                          |
| <kbd>Alt</kbd> + <kbd>i</kbd>     | Insert | Jump to Beginn of Line in insert mode |
| <kbd>Alt</kbd> + <kbd>a</kbd>     | Insert | Jump to End of Line in insert mode    |
| <kbd>Ctrl</kbd> + <kbd>b</kbd>    | Insert | Add curly with comma {},              |

### Editor Functionality

| Keys                                            | Mode          | Description                         |
| ----------------------------------------------- | ------------- | ----------------------------------- |
| <kbd>Escape</kbd>                               | Insert/Normal | Escape and clear highlighted search |
| <kbd>z</kbd> → <kbd>.</kbd>                     | Normal        | 󰓆 Fix Spelling                      |
| <kbd>z</kbd> → <kbd>=</kbd>                     | Normal        | Spelling suggestions                |
| <kbd>Leader</kbd> → <kbd>m</kbd> → <kbd>m</kbd> | Normal        | File Changes (Messages)             |
| <kbd>Leader</kbd> → <kbd>c</kbd> → <kbd>t</kbd> | Normal        | Toggle TS Context                   |

### Plugin Management (Lazy)

| Keys                                            | Mode   | Description           |
| ----------------------------------------------- | ------ | --------------------- |
| <kbd>Leader</kbd> → <kbd>l</kbd> → <kbd>a</kbd> | Normal | Open Lazy             |
| <kbd>Leader</kbd> → <kbd>l</kbd> → <kbd>A</kbd> | Normal | Aerial Symbol Outline |
| <kbd>Leader</kbd> → <kbd>l</kbd> → <kbd>c</kbd> | Normal | Clean Lazy Plugins    |
| <kbd>Leader</kbd> → <kbd>l</kbd> → <kbd>C</kbd> | Normal | Check Lazy Plugins    |
| <kbd>Leader</kbd> → <kbd>l</kbd> → <kbd>m</kbd> | Normal | Mason LSP Manager     |
| <kbd>Leader</kbd> → <kbd>l</kbd> → <kbd>s</kbd> | Normal | Sync Lazy Plugins     |
| <kbd>Leader</kbd> → <kbd>l</kbd> → <kbd>S</kbd> | Normal | LSP Symbols Sidebar   |

### Icons (Nerdy)

| Keys                                            | Mode   | Description              |
| ----------------------------------------------- | ------ | ------------------------ |
| <kbd>Leader</kbd> → <kbd>i</kbd> → <kbd>n</kbd> | Normal | Browse nerd icons        |
| <kbd>Leader</kbd> → <kbd>i</kbd> → <kbd>N</kbd> | Normal | Browse recent nerd icons |

### Image Preview

| Keys                                            | Mode   | Description              |
| ----------------------------------------------- | ------ | ------------------------ |
| <kbd>Leader</kbd> → <kbd>p</kbd> → <kbd>i</kbd> | Normal | Initialize Image Preview |
| <kbd>Leader</kbd> → <kbd>p</kbd> → <kbd>p</kbd> | Normal | Clear Images             |

### Debugging

| Keys                                                           | Mode   | Description                |
| -------------------------------------------------------------- | ------ | -------------------------- |
| <kbd>Leader</kbd> → <kbd>d</kbd> → <kbd>B</kbd>                | Normal | Add Conditional Breakpoint |
| <kbd>Leader</kbd> → <kbd>d</kbd> → <kbd>c</kbd>                | Normal | Dap Continue               |
| <kbd>Leader</kbd> → <kbd>d</kbd> → <kbd>s</kbd> → <kbd>i</kbd> | Normal | Dap Step Into              |
| <kbd>Leader</kbd> → <kbd>d</kbd> → <kbd>s</kbd> → <kbd>o</kbd> | Normal | Dap Step Over              |
| <kbd>Leader</kbd> → <kbd>d</kbd> → <kbd>s</kbd> → <kbd>t</kbd> | Normal | Dap Step Out               |
| <kbd>Leader</kbd> → <kbd>d</kbd> → <kbd>t</kbd>                | Normal | Dap Terminate              |
| <kbd>Leader</kbd> → <kbd>d</kbd> → <kbd>l</kbd>                | Normal | Dap Show Log               |
| <kbd>Leader</kbd> → <kbd>d</kbd> → <kbd>r</kbd>                | Normal | Dap Toggle Repl            |

### Diff View

| Keys                                            | Mode   | Description     |
| ----------------------------------------------- | ------ | --------------- |
| <kbd>Leader</kbd> → <kbd>d</kbd> → <kbd>v</kbd> | Normal | Diffview Toggle |

### Noice

| Keys                                           | Mode   | Description         |
| ---------------------------------------------- | ------ | ------------------- |
| <kbd>Space</kbd> → <kbd>n</kbd> → <kbd>n</kbd> | Normal | Noice Messages      |
| <kbd>Space</kbd> → <kbd>n</kbd> → <kbd>a</kbd> | Normal | Noice All Messages  |
| <kbd>Space</kbd> → <kbd>n</kbd> → <kbd>l</kbd> | Normal | Noice Last          |
| <kbd>Space</kbd> → <kbd>n</kbd> → <kbd>t</kbd> | Normal | Noice Telescope     |
| <kbd>Space</kbd> → <kbd>n</kbd> → <kbd>e</kbd> | Normal | Noice Errors        |
| <kbd>Space</kbd> → <kbd>n</kbd> → <kbd>s</kbd> | Normal | Noice Notifications |

### Terminal Bindings

| Keys                           | Mode     | Description        |
| ------------------------------ | -------- | ------------------ |
| <kbd>Escape</kbd>              | Terminal | Exit Terminal Mode |
| <kbd>k</kbd> → <kbd>j</kbd>    | Terminal | Exit Terminal Mode |
| <kbd>Ctrl</kbd> + <kbd>h</kbd> | Terminal | Window Left        |
| <kbd>Ctrl</kbd> + <kbd>j</kbd> | Terminal | Window Down        |
| <kbd>Ctrl</kbd> + <kbd>k</kbd> | Terminal | Window Up          |
| <kbd>Ctrl</kbd> + <kbd>l</kbd> | Terminal | Window Right       |
| <kbd>Ctrl</kbd> + <kbd>w</kbd> | Terminal | Window             |

### Java Development Tools

| Keys                                            | Mode          | Description         |
| ----------------------------------------------- | ------------- | ------------------- |
| <kbd>Alt</kbd> + <kbd>o</kbd>                   | Normal        | Organize Imports    |
| <kbd>c</kbd> → <kbd>r</kbd> → <kbd>v</kbd>      | Normal/Visual | Extract Variable    |
| <kbd>c</kbd> → <kbd>r</kbd> → <kbd>c</kbd>      | Normal/Visual | Extract Constant    |
| <kbd>c</kbd> → <kbd>r</kbd> → <kbd>m</kbd>      | Visual        | Extract Method      |
| <kbd>Leader</kbd> → <kbd>d</kbd> → <kbd>f</kbd> | Normal        | Test Class          |
| <kbd>Leader</kbd> → <kbd>d</kbd> → <kbd>n</kbd> | Normal        | Test Nearest Method |

### LuaSnip

| Keys                                              | Mode          | Description |
| ------------------------------------------------- | ------------- | ----------- |
| <kbd>Ctrl</kbd> + <kbd>i</kbd>                    | Insert/Select |             |
| <kbd>Ctrl</kbd> + <kbd>l</kbd>                    | Insert/Select |             |
| <kbd>Ctrl</kbd> + <kbd>h</kbd>                    | Insert/Select |             |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>o</kbd> | Insert/Select |             |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>a</kbd> | Insert/Select |             |

### Nvim-Toggler

| Keys                             | Mode          | Description    |
| -------------------------------- | ------------- | -------------- |
| <kbd>Leader</kbd> → <kbd>w</kbd> | Normal/Visual | Toggle a Value |

### Nvim-Tree

| Keys                           | Mode   | Description           |
| ------------------------------ | ------ | --------------------- |
| <kbd>Ctrl</kbd> + <kbd>t</kbd> | Normal | Up Change Directory   |
| <kbd>Ctrl</kbd> + <kbd>d</kbd> | Normal | Change Root Directory |
| <kbd>?</kbd>                   | Normal | Help                  |

### LSP (Language Server Protocol)

| Keys                                                      | Mode          | Description                  |
| --------------------------------------------------------- | ------------- | ---------------------------- |
| <kbd>Space</kbd> → <kbd>d</kbd>                           | Normal        | Open Diagnostic Window       |
| <kbd>Space</kbd> → <kbd>Left</kbd>                        | Normal        |                              |
| <kbd>Space</kbd> → <kbd>Right</kbd>                       | Normal        |                              |
| <kbd>Space</kbd> → <kbd>q</kbd>                           | Normal        | Send Diagnostic to Locallist |
| <kbd>K</kbd>                                              | Normal        | Hover                        |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>a</kbd>                | Normal/Visual | LSP Code Action              |
| <kbd>Alt</kbd> + <kbd>Enter</kbd>                         | Normal/Visual | LSP Code Action              |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>n</kbd>                | Normal        | LSP Rename                   |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>r</kbd>                | Normal        | LSP References               |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>d</kbd>                | Normal        | LSP Go to Definition         |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>D</kbd>                | Normal        | LSP Go to Declaration        |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>i</kbd>                | Normal        | LSP Go to Implementation     |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>f</kbd>                | Normal        |                              |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>k</kbd>                | Normal        | LSP Signature Help           |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>s</kbd>                | Normal        | LSP Document Symbols         |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>t</kbd>                | Normal        | LSP Type Definition          |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>w</kbd> → <kbd>a</kbd> | Normal        | LSP Add Workspace Folder     |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>w</kbd> → <kbd>r</kbd> | Normal        | LSP Remove Workspace Folder  |
| <kbd>g</kbd> → <kbd>r</kbd> → <kbd>w</kbd> → <kbd>l</kbd> | Normal        | List Workplace Folder        |
| <kbd>Space</kbd> → <kbd>i</kbd> → <kbd>h</kbd>            | Normal        | Inlay Hints                  |

### Treesitter

| Keys         | Mode            | Description      |
| ------------ | --------------- | ---------------- |
| <kbd>m</kbd> | Visual/Operator | Treesitter Nodes |

## Inspiration

The following projects were instrumental in the crafting of this environment

- [Allaman's nvim](https://github.com/Allaman/nvim)
- [Alexis12119's nvim-config](https://github.com/Alexis12119/nvim-config)
- [glepnir's nvim](https://github.com/glepnir/nvim)
- [ayamir's nvimdots](https://github.com/ayamir/nvimdots)
- [CharlesChiuGit's nvimdots](https://github.com/CharlesChiuGit/nvimdots.lua)
- [dragove's nvim](https://github.com/dragove/nvim)
- [Dharmx's Nvim](https://github.com/dharmx/nvim)
- [loctvl842's nvim'](https://github.com/loctvl842/nvim)
- **... and many, many more!**

```

```
