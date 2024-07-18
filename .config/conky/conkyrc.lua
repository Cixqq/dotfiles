-- Conky, a system monitor https://github.com/brndnmtthws/conky
--
-- This configuration file is Lua code. You can write code in here, and it will
-- execute when Conky loads. You can use it to generate your own advanced
-- configurations.
--
-- Try this (remove the `--`):
--
--   print("Loading Conky config")
--
-- For more on Lua, see:
-- https://www.lua.org/pil/contents.html

conky.config = {
	alignment = "bottom_right",
	background = false,
	border_width = 1,
	cpu_avg_samples = 2,
	own_window_transparent = false,
	own_window_argb_visual = true,
	own_window_argb_value = 50,
	default_color = "white",
	default_outline_color = "white",
	default_shade_color = "white",
	double_buffer = true,
	draw_borders = false,
	draw_graph_borders = true,
	draw_outline = false,
	draw_shades = false,
	extra_newline = false,
	font = "JetBrains Mono:size=12",
	gap_x = 13,
	gap_y = 13,
	minimum_height = 5,
	minimum_width = 5,
	net_avg_samples = 2,
	no_buffers = true,
	out_to_console = false,
	out_to_ncurses = false,
	out_to_stderr = false,
	out_to_x = true,
	own_window = true,
	own_window_class = "Conky",
	own_window_type = "desktop",
	show_graph_range = false,
	show_graph_scale = false,
	stippled_borders = 0,
	update_interval = 1.0,
	uppercase = false,
	use_spacer = "none",
	use_xft = true,
}

conky.text = [[
${color grey}Uptime:$color $uptime
${color grey}Frequency (in GHz):$color $freq_g
${color grey}RAM Usage:$color $mem/$memmax - $memperc% ${membar 4}
${color grey}Swap Usage:$color $swap/$swapmax - $swapperc% ${swapbar 4}
${color grey}CPU Usage:$color $cpu% ${cpubar 4}
${color grey}Storage: $color${fs_used /}/${fs_size /} ${fs_bar 6 /}
$hr
${color grey}Name              PID     CPU%   MEM%
${color lightgrey} ${top name 1} ${top pid 1} ${top cpu 1} ${top mem 1}
${color lightgrey} ${top name 2} ${top pid 2} ${top cpu 2} ${top mem 2}
${color lightgrey} ${top name 3} ${top pid 3} ${top cpu 3} ${top mem 3}
${color lightgrey} ${top name 4} ${top pid 4} ${top cpu 4} ${top mem 4}
$hr
${color grey}${goto 5}Today ${goto 140}Yesterday ${goto 285}Month ${color green}
${execi 300 vnstat -i wlp0s20u7 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}'}${goto 140}${execi 300 vnstat -i wlp0s20u7 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}'}${goto 285}${execi 300 'vnstat -i wlp0s20u7 -m | grep "`date +"%Y-%m"`" | awk '{print $8 " "substr($9, 1, 1)}''}
${color grey}Down: ${color green}${downspeed wlp0s20u7}/s ${color grey}${goto 220}Up: ${color green}${upspeed wlp0s20u7}/s
${downspeedgraph wlp0s20u7 25,190 000000 ff0000} ${alignr}${upspeedgraph wlp0s20u7 25,190 000000 00ff00}$color
Total RX: ${color green}${totaldown wlp0s20u7} $color${alignr}Total TX: ${color green}${totalup wlp0s20u7}
]]
