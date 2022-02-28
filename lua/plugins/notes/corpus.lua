require("corpus")
-- init.lua (as Lua global):
CorpusDirectories = {
	["~/Notes"] = {
		autocommit = true,
		autoreference = 1,
		autotitle = 1,
		base = "./",
		transform = "web",
		tags = true,
	},
}
