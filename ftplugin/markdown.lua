-- ╭──────────────────────────────────────────────────────────────────────╮
-- │ Markdown filetype settings                                          │
-- │ Applied when opening *.md files                                     │
-- │                                                                     │
-- │ Word wrap: enabled by default for prose.                            │
-- │ Toggle with <leader>w (which-key: 'Save / Sort / Toggle' group).    │
-- │                                                                     │
-- │ Performance: suppress AI ghost text, word highlighting, auto-pair   │
-- │ in insert mode — they fire on every keystroke and are never useful  │
-- │ in prose editing.                                                   │
-- ╰──────────────────────────────────────────────────────────────────────╯

-- WORD WRAP — always on for prose
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.wo.showbreak = '↪ '

-- Disable llama-copilot (AI ghost text) in markdown — it fires on every
-- keystroke, calls the Ollama API, and creates distracting inline hints
-- in prose editing where they're never useful.
vim.b.copilot_enabled = false

-- Disable the snacks.words per-filetype (word highlighting across buffer).
-- It registers on TextChanged which fires on every keystroke.
if vim.b.snacks_words ~= nil then
    vim.b.snacks_words = false
end

-- Suppress auto-pairing in markdown (mini.pairs) — prose typing frequently
-- fights with auto-close behavior on quotes, backticks, etc.
vim.b.minipairs_disable = true
