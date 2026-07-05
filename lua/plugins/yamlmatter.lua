-- ╭──────────────────────────────────────────────────────────╮
-- │               YAMLMATTER.NVIM                            │
-- │  Enhanced YAML frontmatter display in Markdown files     │
-- │                                                          │
-- │  Replaces raw YAML frontmatter with a styled, icon-rich  │
-- │  display using nerd font glyphs. Keys like `title`,      │
-- │  `author`, `date`, `tags` get distinct icons.            │
-- │  Long values wrap to window width.                       │
-- ╰──────────────────────────────────────────────────────────╯
return {
    'ray-x/yamlmatter.nvim',
    ft = 'markdown',
    opts = {
        icon_mappings = {
            title = '',
            author = '',
            date = '',
            id = '',
            tags = '',
            category = '',
            type = '',
            idea = '',
            default = '󰦨',
        },
        highlight_groups = {
            icon = 'YamlMatterIcon',
            key = 'YamlMatterKey',
            value = 'YamlMatterValue',
        },
        key_value_padding = 4,
        conceallevel = 1,
    },
    config = function(_, opts)
        require('yamlmatter').setup(opts)
    end,
}
