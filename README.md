<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.imgur.com/6wj0hh6.jpg" alt="Project logo"></a>
</p>

<h3 align="center">NeoVim Configuration</h3>

---

<p align="center"> A Lua based NeoVim configuration, now as a module, that bakes in no solutions and adds no additional complexity between the user and the configuration, enabling you to freely tweak it to your needs while still packaging in all of the functionality necessary for a fully featured, IDE-like experience.
    <br>
</p>

## 📝 Table of Contents
- [About](#about)
- [Getting Started](#getting_started)
- [Design](#design)
- [Plugins](#plugins)
- [Acknowledgments](#acknowledgement)

## 🧐 About <a name = "about"></a>
A lot of great NeoVim configurations written in Lua exist for the user to choose from, yet many of these options bake in some sort of internal plugins or add additional complexities that make tinkering with them in any substantial sense really frustrating. I don't want all of my modifications consigned to one `user_config.lua` file and so I wrote my own configuration that doesn't do this and gives the user full freedom to do whatever they would like to with the configuration under the hood to meet their needs.

Which there are plenty of these options too, I understand and probably have played around with them myself. However, these options tend to be minimal as defaults, which is also something I didn't do here. With this configuration, an opinionated but functional default is provided that you can use without modifying much, or at all, an still experience a powerful, IDE-like environment within your terminal and using the Xresources colors your system already provides.

## Prerequisites
To use this configuration, you'll need the nightly edition of NeoVim (> `0.6`). To install it, I provide a convenient script for you in the repository that is a one-line install command, which you can find below.

```
curl -o-  https://raw.githubusercontent.com/Thomashighbaugh/nvim/main/bin/install-latest-neovim.sh | bash

```

### Installing

I have also streamlined this process so that you can run a single command. This will move any present configuration for nvim located in `~/.config/nvim` to `~/.config/nvim.back` just to be safe and then clone the repository and install Packer for you.

```
curl -o-  https://raw.githubusercontent.com/Thomashighbaugh/nvim/main/bin/install | bash
```
This will show some errors, they emerge from the configuration expecting the plugins it has opened to install, just hit enter through them and let it do its thing.

Now you just start neovim as you normally would and things will be as configured. To be sure things are working appropiately enter the following as a first boot command for nvim

```
nvim -c "PackerSync"
```
This reruns Packer's sync function that will install and then compile the plugins in your `.local/share/nvim` directory which Packer typically lives and works in.



## Plugins


## Design Rationale
> So the configuration is entirely nested within a directory within the typical lua directory now, why?

The thought here has been two things, the first is that were anyone else to use this configuration, it simplifies the process of overriding my defaults by simply including their configurations below my single import statement in `init.lua` (the top level most `init.lua`) which I hope streamlines anyone else adopting this configuration that doesn't like things exactly like I do but has no taste for diving into my code and working it out from the bottom up. This is intended to make that easier without turning it into a module or locked in paradigm like the venerable but hard to work with repos listed at the bottom of the README.

It also makes for a neat top-most `init.lua`, which I think is a much better way to organize things in Lua code, keeping the most important code from being a hideous mess makes it mentally less straining to work with. There is a reason I don't work with emacs and the lisp monsteriousity under its hood.

> Why Use Lua?
For me personally, because I know a bit of Lua already from AwesomeWM configuration. Not its biggest fan but like it more than vimscript for instance.

For NeoVim as software, Lua was designed to extend applications, exposing C functionality while retaining the top-to-bottom readability of the scripting languages. Which is cool, too bad its an ugly language that is practically useless everywhere else...

**But really** it makes my NeoVim configuration scream compared to the sluggish vim configuration I was using prior and suffers from none the the issues with structuring paradigms that are archiac and inaccessible that vim configurations typically suffered from (which you can still use but there is little point when you can use packer to achieve the same thing and keep your configuration organized in such a way as to make the most sense to you).




## 🎉 Acknowledgements <a name = "acknowledgement"></a>
All of these inspired, and portions of them were clipped for, this configuration. As many if not all are moving towards being plugins/paradigms they were unsuitable for my wholesale adoption and I find such canned configurations far too stifling for my use case, especially in regards to my love of note-taking plugins, but they deserve a mention and the links will serve anyone coming across this and looking for more Lua based nvim configurations if they so need to check these out still.

- [NvChad](https://github.com/NvChad/NvChad)
- [Doom Nvim](https://github.com/NTBBloodbath/doom-nvim)
- [StarVim](https://github.com/ashincoder/StarVim)
- [CosmicNvim](https://github.com/mattleong/CosmicNvim)
- [LunarVim](https://github.com/LunarVim/LunarVim)
