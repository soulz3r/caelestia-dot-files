return {
  hl.config({
    misc = {
      animate_manual_resizes       = true,
      animate_mouse_windowdragging = true,
    },
    ["debug.disable_scale_checks"] = true,
  }),

  -- 1. Monitors Configuration
  hl.monitor({
    output = "HDMI-A-1",
    mode = "1366x768@75",
    position = "1x1",
    scale = 1,
  }),

  -- 2. Input / Devices Configuration
  hl.device({
    name = "instant-usb-gaming-mouse-",
    sensitivity = -0.4,
    accel_profile = "flat",
  }),

  -- 3. Autostart Execution Block
  hl.on("hyprland.start", function()
    -- This opens Spotify, waits 1 second, toggles caelestia, then KILLS Spotify
    hl.exec_cmd("bash -c 'fcxit5 -d && sleep 1'")
    hl.exec_cmd("bash -c 'spotify >/dev/null 2>&1 & sleep 2; caelestia shell drawers toggle music'")
  end
),

hl.window_rule({
  match     = {
    class = "com.rtosta.zapzap|zapzap|discord|equibop|vesktop|whatsapp",
  },
  workspace = "special:communication",
}),
}
