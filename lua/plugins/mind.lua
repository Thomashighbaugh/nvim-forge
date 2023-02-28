local M = {
  'phaazon/mind.nvim',
  branch = 'v2.2',
  dependencies = {'nvim-lua/plenary.nvim'},
  config = function()
    require('mind').setup({
      persistence = {
        state_path = '~/Notes/mind/mind.json',
        data_dir = '~/Notes/mind/data'
      },

      ui = {width = 30, highlight = {node_root = 'Number'}},
      keymaps = {
        normal = {
          T = function(args)
            require'mind.ui'.with_cursor(function(line)
              local tree = args.get_tree()
              local node = require'mind.node'.get_node_by_line(tree, line)

              if node.icon == nil or node.icon == ' ' then
                node.icon = ' '
              elseif node.icon == ' ' then
                node.icon = ' '
              elseif node.icon == ' ' then
                node.icon = ' '
              end

              args.save_tree()
              require'mind.ui'.rerender(tree, args.opts)
            end)
          end
        },
      }
    })
  end
}

return M
