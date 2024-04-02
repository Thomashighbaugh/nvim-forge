# NeoVim Forge

My [Winchester Mystery](https://en.wikipedia.org/wiki/Winchester_Mystery_House)
NeoVim Configuration, using `lazy.nvim` for plugin management and Lua as its
configuration language. My _Personal Development Environment_ (PDE) and the core tool used in cultivating my Personal Knowledge Base (PKB).

> **Warning**
> This is my personal configuration, subject to experimentation
> and radical rewrites periodically, rebases or substantially modifications
> without prior warning and other things that may make this unstable for you
> to use as it is presented.

With this in mind, **feel free to take from it as you please**, use pieces of
it or the whole thing as a basis for your own and you are more than welcome
to **submit pull requests** if it so pleases you, that's why its on
GitHub  |wink |

## Installation

To use this configuration, clone it into your `~/.config/nvim` directory |

```sh

# Back up your old configuration if present
mv ~/.config/nim ~/.config/nvim.bak
# Now clone this one
git clone https://github.com/Thomashighbaugh/nvim-forge ~/.config/nvim

```

And that should be it, if you have the prerequisites installed it should run through the lazy.nvim installation process and handle setting up everything in the process from Treesitter grammars to Mason dependencies, it might just take a few minutes so be patient.

## Configuration Structure

This configuration roughly follows that of LazyVim, with some minor changes that are mostly due to personal taste, which while arbitrary is much easier to quickly locate various things when they are arranged in the way one prefers and not an artificially imposed standard. The lion's share of the configuration exists within the `lua/` subdirectory as is the convention of Lua-based NeoVim configurations.

Unlike many other highly customized NeoVim configurations, as well as most major configuration frameworks, the configuration is not nested within a subdirectory of the Lua subdirectory named after the author, plugin or configuration, I find no need to brand this configuration in a way that makes using its parts elsewhere highly onerous and introduces a needless source of potential errors for me to deal with instead of working on code like I intend to be.

Below is a representation of the structure of the configuration in tree format |
 .
├──  cheatsheet.txt
├──  doc
│ └──  nvim-forge.txt
├──  Dockerfile
├──  init.lua
├──  lazy-lock.json
├──  LICENSE
├──  lua
│ ├──  core
│ │ ├──  autocmds.lua
│ │ ├──  commands.lua
│ │ ├──  icons.lua
│ │ ├──  init.lua
│ │ ├──  keymaps.lua
│ │ ├──  lazy.lua
│ │ ├──  logos.lua
│ │ └──  options.lua
│ ├──  features
│ │ ├──  lsp
│ │ │ ├──  diagnostics.lua
│ │ │ ├──  init.lua
│ │ │ ├──  keymaps.lua
│ │ │ ├──  lang
│ │ │ │ ├──  docker.lua
│ │ │ │ ├──  flutter.lua
│ │ │ │ ├──  go.lua
│ │ │ │ ├──  java.lua
│ │ │ │ ├──  json.lua
│ │ │ │ ├──  markdown.lua
│ │ │ │ ├──  markup.lua
│ │ │ │ ├──  nix.lua
│ │ │ │ ├──  php.lua
│ │ │ │ ├──  python.lua
│ │ │ │ ├──  rust.lua
│ │ │ │ ├──  typescript.lua
│ │ │ │ └──  vue.lua
│ │ │ └──  navic.lua
│ │ ├──  lualine
│ │ │ ├──  components.lua
│ │ │ ├──  config.lua
│ │ │ ├──  init.lua
│ │ │ ├──  palette.lua
│ │ │ └──  theme.lua
│ │ └──  neo-tree
│ │ ├──  init.lua
│ │ └──  sources
│ │ └──  filesystem
│ │ └──  components.lua
│ ├──  init.lua
│ ├──  plugins
│ │ ├──  aisync.lua
│ │ ├──  coding.lua
│ │ ├──  colorscheme.lua
│ │ ├──  editor.lua
│ │ ├──  formatting.lua
│ │ ├──  init.lua
│ │ ├──  linting.lua
│ │ ├──  lsp.lua
│ │ ├──  shared.lua
│ │ ├──  tools.lua
│ │ ├──  treesitter.lua
│ │ └──  ui.lua
│ ├──  profile.lua
│ └──  utils
│ ├──  cmd.lua
│ ├──  init.lua
│ ├──  lsp.lua
│ ├──  lualine.lua
│ ├──  plugin.lua
│ ├──  root.lua
│ ├──  string.lua
│ ├──  table.lua
│ ├──  telescope.lua
│ └──  theme.lua
├──  README.md -> .github/README.md
├──  snippets
│ ├──  all.lua
│ ├──  java.snippets
│ ├──  markdown.lua
│ ├──  package.json
│ ├──  vscode
│ │ ├──  c.json
│ │ ├──  cpp.json
│ │ ├──  css.json
│ │ ├──  fennel.json
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
├──  spell
│ ├──  en.dict
│ ├──  en.utf-8.add
│ ├──  en.utf-8.add.spl
│ ├──  es.dict
│ ├──  hi.dict
│ └──  README.md
├──  stylua.toml
└──  ui.lua

```
## Keybindings

Below are the keybind mappings used in this configuration, they are subject to change and are not exhaustive, but they should give you a good idea of how the configuration is set up and how to use it.


### General Keybindings 

| <kbd>\\</kbd> | Open a vertical split. | 
| <kbd>/</kbd> | Open a horizontal split. | 
| <kbd><C-m-n></kbd> | Compile the current file. | 
| <kbd><F2></kbd> | Inspect the current file. |
| <kbd>Tab</kbd> | Move to the next buffer. |
| <kbd><S-Tab></kbd> | Move to the previous buffer. |
| <kbd>/</kbd> | Search for text. |
| <kbd><C-s></kbd> | Save the current file (works in various modes). |
| <kbd><leader>w</kbd> | Save the current file. |
| <kbd><leader>q</kbd> | Quit NeoVim. |
| <kbd><leader>Q</kbd> | Quit all open buffers in NeoVim. |
| <kbd><leader>h</kbd> | Clear highlighting. |
| <kbd><leader><Tab></kbd> | Navigate to the previous buffer. |
| <kbd><leader>g</kbd> | Access Git functionalities. |
| <kbd><leader>l</kbd> | Access LSP functionalities. |
| <kbd><leader>s</kbd> | Manage sessions. |
| <kbd>f</kbd> | Fold code. |
| <kbd>g</kbd> | Go to specific line or location. |
| <kbd>s</kbd> | Search for text. |

### Buffer Management 

<kbd><C-1/9></kbd> | Change to buffers 1 through 9. |
<kbd><S-l></kbd> | Move to the next buffer. |
<kbd><S-h></kbd> | Move to the previous buffer. | 
<kbd><A-S-l></kbd> | Move buffer to the right. |
<kbd><A-S-h></kbd> | Move buffer to the left. |
<kbd><leader>d</kbd> or <kbd><C-w></kbd> | Close the current buffer. |

### Session Management 

| <kbd><leader>ss</kbd> | Restore a saved session. |
| <kbd><leader>sl</kbd> | Restore the last saved session.
| <kbd><leader>sd</kbd> | Don't save the current session.

### NeoTree 
| <kbd><leader>e</kbd> | Open NeoTree in the current window. |
| <kbd><leader>E</kbd> | Open NeoTree in a floating window. |

### Telescope 

| <kbd>gd</kbd> | Go to definition. |
| <kbd>gr</kbd> | Go to references. |
| <kbd>gi</kbd> | Go to implementations. |
| <kbd><leader>go</kbd> | Open a recently changed file. |
| <kbd><leader>gb</kbd> | Checkout a Git branch. |
| <kbd><leader>gc</kbd> | Checkout a Git commit. |
| <kbd><leader>f</kbd> | Find files. |
| <kbd><leader>F</kbd> | Find text. |
| <kbd><leader>b</kbd> | Find buffers. |

### Other Keybindings  

| <kbd><C-\></kbd> | Toggle the terminal. |
| <kbd><C-0></kbd> | Open the dashboard. |
| <kbd><leader>m</kbd> | Zoom the current window. |
| <kbd><leader>r</kbd> | Open the nvim-forge.core configuration file. |
| <kbd><leader>P</kbd> | Preview the current Markdown file. |



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

```
