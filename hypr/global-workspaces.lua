-- Global workspaces, as used before Omarchy 4.5.
-- Disable the default manager's reconciliation on reload and monitor hotplug.
-- Its registered event handlers call this field, so no packaged files change.
local workspaces = o.workspaces
workspaces.reconcile = function() end

function workspaces.workspace_id(_, slot)
  return slot
end

function workspaces.focus(slot)
  return hl.dsp.focus({ workspace = tostring(slot) })
end

function workspaces.move_window(slot, follow)
  return hl.dsp.window.move({ workspace = tostring(slot), follow = follow ~= false })
end

function workspaces.move_to_monitor(direction)
  return hl.dsp.workspace.move({ monitor = direction })
end

for workspace = 1, 10 do
  local old_key = "code:" .. tostring(workspace + 9)
  hl.unbind("SUPER + " .. old_key)
  hl.unbind("SUPER + SHIFT + " .. old_key)
  hl.unbind("SUPER + SHIFT + ALT + " .. old_key)
  local key = tostring(workspace % 10)
  o.rebind("SUPER + " .. key, "Switch to workspace " .. workspace, workspaces.focus(workspace))
  o.rebind("SUPER + SHIFT + " .. key, "Move window to workspace " .. workspace, workspaces.move_window(workspace))
  o.rebind("SUPER + SHIFT + ALT + " .. key, "Move window silently to workspace " .. workspace, workspaces.move_window(workspace, false))
end

for key, direction in pairs({ LEFT = "l", RIGHT = "r", UP = "u", DOWN = "d" }) do
  o.rebind("SUPER + SHIFT + ALT + " .. key, "Move workspace to " .. direction .. " monitor", workspaces.move_to_monitor(direction))
end

o.rebind("SUPER + TAB", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
o.rebind("SUPER + SHIFT + TAB", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))
o.rebind("SUPER + CTRL + TAB", "Former workspace", hl.dsp.focus({ workspace = "previous" }))
o.rebind("SUPER + mouse_down", "Scroll workspace forward", hl.dsp.focus({ workspace = "e+1" }))
o.rebind("SUPER + mouse_up", "Scroll workspace backward", hl.dsp.focus({ workspace = "e-1" }))
