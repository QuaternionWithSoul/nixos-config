pcall(require, "luarocks.loader")

local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")


if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end


do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then
            return
        end

        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })

        in_error = false
    end)
end

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

modkey = "Mod4"

awful.layout.layouts = {
    awful.layout.suit.tile,
}

local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper

        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end

        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    gears.wallpaper.maximized("./public/wallpaper.png", s, true)

    awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(
        gears.table.join(
            awful.button({ }, 1, function ()
                awful.layout.inc(1)
            end),
            awful.button({ }, 3, function ()
                awful.layout.inc(-1)
            end),
            awful.button({ }, 4, function ()
                awful.layout.inc(1)
            end),
            awful.button({ }, 5, function ()
                awful.layout.inc(-1)
            end)
        )
    )

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = gears.table.join(
            awful.button({ }, 1, function(t)
                t:view_only()
            end),
            awful.button({ modkey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
            awful.button({ }, 4, function(t)
                awful.tag.viewnext(t.screen)
            end),
            awful.button({ }, 5, function(t)
                awful.tag.viewprev(t.screen)
            end)
        )
    }

    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = gears.table.join(
            awful.button({ }, 1, function (c)
                if c == client.focus then
                    c.minimized = true
                else
                    c:emit_signal(
                        "request::activate",
                        "tasklist",
                        {raise = true}
                    )
                end
            end),
            awful.button({ }, 3, function()
                awful.menu.client_list({
                    theme = { width = 250 }
                })
            end),
            awful.button({ }, 4, function ()
                awful.client.focus.byidx(1)
            end),
            awful.button({ }, 5, function ()
                awful.client.focus.byidx(-1)
            end)
        )
    }

    s.mywibox = awful.wibar({ position = "top", screen = s })
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist,
        {
            layout = wibox.layout.fixed.horizontal,
            awful.widget.keyboardlayout(),
            wibox.widget.systray(),
            wibox.widget.textclock(),
            s.mylayoutbox,
        },
    }
end)

root.buttons(
    gears.table.join(
        awful.button({ }, 4, awful.tag.viewnext),
        awful.button({ }, 5, awful.tag.viewprev)
    )
)

globalkeys = gears.table.join(
    awful.key({ modkey }, "Left",
        function ()
            awful.client.focus.byidx(-1)
        end,
        { description = "focus previous by index", group = "management" }
    ),
    awful.key({ modkey }, "Right",
        awful.client.focus.byidx(1),
        { description = "focus next by index", group = "management" }
    ),
    awful.key({ modkey }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "management" }
    ),
    awful.key({ modkey, "Control" }, "n",
        function ()
            local c = awful.client.restore()
            
            if c then
                c:emit_signal("request::activate", "key.unminimize", {raise = true})
            end
        end,
        { description = "restore minimized", group = "management" }
    ),


    awful.key({ modkey }, "Return",
        function ()
            awful.spawn("alacritty")
        end,
        { description = "open a alacritty", group = "soft" }
    ),
    awful.key({ modkey }, "r",
        function ()
            awful.spawn("rofi -show drun || pkill rofi")
        end,
        { description = "open a rofi", group = "soft" }
    ),

    awful.key({ }, "Print",
        function()
            awful.spawn("scrot ~/ScreenShot/%Y-%m-%d_%H-%M-%S.png")
        end,
        {description = "screenshot of the entire screen", group = "screen"}
    ),
    awful.key({ modkey }, "Print",
        function()
            awful.spawn("scrot ~/ScreenShot/%Y-%m-%d_%H-%M-%S.png -s")
        end,
        {description = "screenshot of screen area", group = "screen"}
    ),


    awful.key({ modkey, "Control" }, "r",
        awesome.restart,
        { description = "reload awesome", group = "awesome" }
    ),
    awful.key({ modkey, "Shift" }, "q",
        awesome.quit,
        { description = "quit awesome", group = "awesome" }
    )
)

for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]

                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #"..i, group = "management" }
        ),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]

                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #"..i, group = "management" }
        )
    )
end

root.keys(globalkeys)

awful.rules.rules = {
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = gears.table.join(
                awful.key({ modkey, "Shift" }, "f",
                    function (c)
                        c.fullscreen = not c.fullscreen
                        c:raise()
                    end,
                    { description = "toggle fullscreen", group = "management" }
                ),
                awful.key({ modkey }, "q",
                    function (c)
                        c:kill()
                    end,
                    { description = "close", group = "management" }
                ),
                awful.key({ modkey }, "c",
                    function (c)
                        c.minimized = true
                    end ,
                    { description = "minimize", group = "management" }
                ),
                awful.key({ modkey }, "m",
                    function (c)
                        c.maximized = not c.maximized
                        c:raise()
                    end ,
                    { description = "(un)maximize", group = "management" }
                ),
                awful.key({ modkey, "Control" }, "m",
                    function (c)
                        c.maximized_vertical = not c.maximized_vertical
                        c:raise()
                    end ,
                    { description = "(un)maximize vertically", group = "management" }
                ),
                awful.key({ modkey, "Shift"   }, "m",
                    function (c)
                        c.maximized_horizontal = not c.maximized_horizontal
                        c:raise()
                    end ,
                    { description = "(un)maximize horizontally", group = "management" }
                )
            ),
            buttons = gears.table.join(
                awful.button({ }, 1, function (c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                end),
                awful.button({ modkey }, 1, function (c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                    awful.mouse.client.move(c)
                end),
                awful.button({ modkey }, 3, function (c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                    awful.mouse.client.resize(c)
                end)
            ),
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    },

    {
        rule_any = {
            instance = {
                "DTA",
                "copyq",
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin",
                "Sxiv",
                "Tor Browser",
                "Wpa_gui",
                "veromix",
                "xtightvncviewer"
            },
            name = {
                "Event Tester",
            },
            role = {
                "AlarmWindow",
                "ConfigManager",
                "pop-up",
            }
        },
        properties = {
            floating = true
        }
    },

    {
        rule_any = {
            type = {
                "normal",
                "dialog",
            }
        },
        properties = {
            titlebars_enabled = true
        }
    },
}

client.connect_signal("manage", function (c)
    if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("request::titlebars", function(c)
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        {
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        {
            {
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        {
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)
