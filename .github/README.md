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
GitHub :wink:

## Installation
To use this configuration, clone it into your `~/.config/nvim` directory:

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

Below is a representation of the structure of the configuration in tree format: 
```txt
├──  cheatsheet.txt
├──  doc
│  └──  nvim-forge.txt
├──  Dockerfile
├──  init.lua
├──  lazy-lock.json
├──  LICENSE
├──  lua
│  ├──  core
│  │  ├──  autocmds.lua
│  │  ├──  icons.lua
│  │  ├──  keymaps.lua
│  │  ├──  lazy.lua
│  │  ├──  logo.lua
│  │  └──  options.lua
│  ├──  plugins
│  │  ├──  coding.lua
│  │  ├──  colorscheme.lua
│  │  ├──  config
│  │  │  ├──  cmp
│  │  │  │  └──  dict.lua
│  │  │  ├──  compile.lua
│  │  │  ├──  dashboard.lua
│  │  │  ├──  hydra
│  │  │  │  ├──  hydra.lua
│  │  │  │  ├──  spelling.lua
│  │  │  │  ├──  telescope.lua
│  │  │  │  └──  windows.lua
│  │  │  ├──  lsp
│  │  │  │  ├──  diagnostics.lua
│  │  │  │  ├──  gitsigns.lua
│  │  │  │  └──  keymaps.lua
│  │  │  ├──  lualine
│  │  │  │  ├──  components.lua
│  │  │  │  ├──  config.lua
│  │  │  │  ├──  highlights.lua
│  │  │  │  └──  init.lua
│  │  │  └──  neo-tree
│  │  │     ├──  init.lua
│  │  │     └──  sources
│  │  │        └──  filesystem
│  │  │           └──  components.lua
│  │  ├──  editor.lua
│  │  ├──  formatting.lua
│  │  ├──  lang
│  │  │  ├──  clangd.lua
│  │  │  ├──  docker.lua
│  │  │  ├──  java.lua
│  │  │  ├──  json.lua
│  │  │  ├──  markdown.lua
│  │  │  ├──  nix.lua
│  │  │  ├──  php.lua
│  │  │  ├──  python.lua
│  │  │  ├──  rust.lua
│  │  │  └──  typescript.lua
│  │  ├──  lsp.lua
│  │  ├──  settings.lua
│  │  ├──  tools.lua
│  │  ├──  treesitter.lua
│  │  ├──  ui.lua
│  │  └──  util.lua
│  └──  util.lua
├──  neovim
├──  README.md -> .github/README.md
├──  snippets
│  ├──  all.lua
│  ├──  java.snippets
│  ├──  markdown.lua
│  ├──  package.json
│  ├──  vscode
│  │  ├──  c.json
│  │  ├──  cpp.json
│  │  ├──  css.json
│  │  ├──  fennel.json
│  │  ├──  frameworks
│  │  │  ├──  ejs.json
│  │  │  ├──  flutter.json
│  │  │  ├──  jekyll.json
│  │  │  └──  vue
│  │  │     ├──  html.json
│  │  │     ├──  javascript.json
│  │  │     ├──  pug.json
│  │  │     └──  vue.json
│  │  ├──  gdscript.json
│  │  ├──  gitcommit.json
│  │  ├──  global.json
│  │  ├──  glsl.json
│  │  ├──  go.json
│  │  ├──  haskell.json
│  │  ├──  html.json
│  │  ├──  java.json
│  │  ├──  javascript
│  │  │  ├──  javascript.json
│  │  │  ├──  react-native-ts.json
│  │  │  ├──  react-native.json
│  │  │  ├──  react-ts.json
│  │  │  ├──  react.json
│  │  │  └──  typescript.json
│  │  ├──  kotlin.json
│  │  ├──  kubernetes.json
│  │  ├──  latex
│  │  │  ├──  latex-snippets.json
│  │  │  └──  vscode-latex-snippets.json
│  │  ├──  latex.json
│  │  ├──  lua.json
│  │  ├──  markdown.json
│  │  ├──  meson.json
│  │  ├──  norg.json
│  │  ├──  org.json
│  │  ├──  package.json
│  │  ├──  python
│  │  │  ├──  base.json
│  │  │  ├──  comprehension.json
│  │  │  ├──  debug.json
│  │  │  ├──  python.json
│  │  │  └──  unittest.json
│  │  ├──  rust.json
│  │  ├──  scala.json
│  │  ├──  shell.json
│  │  └──  sql.json
│  └──  yaml.lua
├──  spell
│  ├──  en.dict
│  ├──  en.utf-8.add
│  ├──  en.utf-8.add.spl
│  ├──  es.dict
│  ├──  hi.dict
│  └──  README.md
└──  stylua.toml
```
The `lua/` subdirectory is where the majority of the configuration resides, with the `core/` subdirectory containing the core configuration, `plugins/config/` containing the configuration for plugins when a more substantial configuration is necessary for a plugin and `plugins/` containing the enumeration of and initial setup configurations for the various plugins used by the configuration. All of which is, of course, managed by `lazy.nvim`. Within the `resources/` subdirectory is an additional `lang/` subdirectory that contains the configuration for language servers and other language-specific configuration.

## Inspiration

The following projects were instrumental in the crafting of this environment:

- [Allaman's nvim](https://github.com/Allaman/nvim)
- [Alexis12119's nvim-config](https://github.com/Alexis12119/nvim-config)
- [glepnir's nvim](https://github.com/glepnir/nvim)
- [ayamir's nvimdots](https://github.com/ayamir/nvimdots)
- [CharlesChiuGit's nvimdots](https://github.com/CharlesChiuGit/nvimdots.lua)
- [dragove's nvim](https://github.com/dragove/nvim)
- [Dharmx's Nvim](https://github.com/dharmx/nvim)
- [loctvl842's nvim'](https://github.com/loctvl842/nvim)

