version = "0.21.7"

-- Поддержка плагинов
local home = os.getenv("HOME")
package.path = home
  .. "/.config/xplr/plugins/?/init.lua;"
  .. home
  .. "/.config/xplr/plugins/?.lua;"
  .. package.path

-- Превью панель
xplr.fn.custom.preview_pane = {}
xplr.fn.custom.preview_pane.render = function(ctx)
  local n = ctx.app.focused_node
  if n and n.canonical then n = n.canonical end
  if not n then return { CustomParagraph = { ui = {}, body = "" } } end

  local name = xplr.util.basename(n.absolute_path)
  local title = { format = name, style = xplr.util.lscolor(n.absolute_path) }

  local body = ""
  local function read(path, height)
    local f = io.open(path)
    if not f then return nil end
    local i, res = 0, ""
    for line in f:lines() do
      if line:match("[^ -~\n\t]") then f:close(); return end
      res = res .. line .. "\n"
      if i == height then break end
      i = i + 1
    end
    f:close()
    return res
  end

  if n.is_file then
    body = read(n.absolute_path, ctx.layout_size.height)
      or xplr.util.to_yaml(xplr.util.node(n.absolute_path))
  else
    body = xplr.util.to_yaml(xplr.util.node(n.absolute_path))
  end

  return { CustomParagraph = { ui = { title = title }, body = body } }
end

-- Вставляем превью вместо HelpMenu
local preview_pane = { Dynamic = "custom.preview_pane.render" }
xplr.config.layouts.builtin.default =
  xplr.util.layout_replace(xplr.config.layouts.builtin.default, "HelpMenu", preview_pane)

-- Плагины
require("dual-pane").setup()
require("icons").setup()
