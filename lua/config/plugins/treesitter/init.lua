require('nvim-treesitter.configs').setup(
    {
        ensure_installed = {
            'typescript',
            'javascript',
            'tsx',
            'html',
            'css',
            'bash',
            'lua',
            'json',
            'python',
            'php',
            'scss',
            'go',
            'rust',
            'dot',
            'd',
            'dockerfile',
            'c',
            'fennel',
            'cmake',
            'cpp',
            'zig',
            'yang',
            'yaml',
            'vue',
            'vim',
            'verilog',
            'turtle',
            'toml',
            'ruby',
            'teal',
            'rasi',
            'regex',
            'rst',
            'php',
            'pug',
            'pascal',
            'make',
            'markdown',
            'nix',
            'perl',
            'kotlin',
            'latex',
            'llvm',
            'julia',
            'java',
            'jsonc',
            'json5',
            'json',
            'http'
        },
        highlight = {
            enable = true,
            use_languagetree = true
        },
        indent = {
            enable = true
        },
        autotag = {
            enable = true
        },
        context_commentstring = {
            enable = true
        },
        refactor = {
            highlight_definitions = {enable = true},
            highlight_current_scope = {enable = false}
        }
    }
)
