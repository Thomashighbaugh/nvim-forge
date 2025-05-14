-- as defining all of the snippet-constructors (s, c, t, ...) in every file is rather cumbersome,
-- luasnip will bring some globals into scope for executing these files.
-- defined by snip_env in setup
require('luasnip.loaders.from_lua').lazy_load()
local env = snip_env

return {
    env.s('date', env.p(os.date, '%y-%m-%d')),
    env.s('time', env.p(os.date, '%h:%m')),
    env.s('htime', env.p(os.date, '%y-%m-%dt%h:%m:%s+10:00')),
}
