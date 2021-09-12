local config = require('deardiary.config')
local lustache = require('lib.lustache')

local personal_daily_template = [[
# {{ date }}
## Todo
## Notes
## Journal
]]

local default_weekly_template = [[
# {{ header }}
{{ #dates }}
## {{ . }}
{{ /dates }}
]]

local personal_weekly_template =
    [[
# {{ header }}
{{ #dates }}
## {{ . }}
### Meal Plan
- Breakfast:
- Lunch:
- Dinner:
### Todo
[ ] Task 1
[ ] Task 2
{{ /dates }}
]]

local dev_daily_template = [[
# {{ date }}
## Notes
]]

local template_daily = function(entry_date, daily_template_str)
    local view_model = {
        date = entry_date:fmt('%A, %B %d, %Y')
    }
    return lustache:render(daily_template_str, view_model)
end

local template_weekly = function(entry_date, weekly_template_str)
    local dates = {}
    for i = 0, 6 do
        local d = entry_date:copy():adddays(i)
        table.insert(dates, d:fmt('%A, %B %d, %Y'))
    end
    local header = entry_date:fmt('Week %W of %Y: ') .. dates[1] .. ' - ' .. dates[7]
    local view_model = {
        dates = dates,
        header = header
    }
    return lustache:render(weekly_template_str, view_model)
end

config.frequencies.weekly.template = function(entry_date)
    return template_weekly(entry_date, default_weekly_template)
end

config.journals = {
    {
        path = '~/Notes/personal/journal',
        frequencies = {
            daily = {
                template = function(entry_date)
                    return template_daily(entry_date, personal_daily_template)
                end
            },
            weekly = {
                template = function(entry_date)
                    return template_weekly(entry_date, personal_weekly_template)
                end
            }
        }
    },
    {
        path = '~/Notes/dev/journal',
        frequencies = {
            daily = {
                template = function(entry_date)
                    return template_daily(entry_date, dev_daily_template)
                end
            },
            'weekly'
        }
    }
}

vim.api.nvim_set_keymap("n", "<Leader>jsd", "<Plug>(DearDiarySelectJournal)", {})
