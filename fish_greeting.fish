#!/usr/bin/env fish

function fish_greeting
    # Color definitions
    set -l banner_cyan (set_color cyan)
    set -l banner_blue (set_color blue)
    set -l banner_green (set_color green)
    set -l banner_yellow (set_color yellow)
    set -l banner_magenta (set_color magenta)
    set -l banner_reset (set_color normal)
    set -l banner_bold (set_color --bold)

    # ASCII Art Banner
    echo
    echo $banner_cyan"    ╔═══════════════════════════════════════════════════════╗"$banner_reset
    echo $banner_cyan"    ║"$banner_blue"            🐠  Welcome to Fish Shell  🐠              "$banner_cyan"║"$banner_reset
    echo $banner_cyan"    ╚═══════════════════════════════════════════════════════╝"$banner_reset
    echo

    # System Information
    set -l banner_host_name (hostname)
    set -l banner_user_name (whoami)
    set -l banner_os_version (sw_vers -productVersion 2>/dev/null || echo "Unknown")
    set -l banner_shell_version (fish --version | string split ' ')[3]
    set -l banner_current_date (date "+%A, %B %d, %Y")
    set -l banner_current_time (date "+%I:%M %p")

    echo $banner_bold$banner_green"    User:"$banner_reset"        $banner_user_name"
    echo $banner_bold$banner_green"    Host:"$banner_reset"        $banner_host_name"
    echo $banner_bold$banner_green"    macOS:"$banner_reset"       $banner_os_version"
    echo $banner_bold$banner_green"    Shell:"$banner_reset"       fish $banner_shell_version"
    echo $banner_bold$banner_yellow"    Date:"$banner_reset"        $banner_current_date"
    echo $banner_bold$banner_yellow"    Time:"$banner_reset"        $banner_current_time"
    echo

    # Quick tip or quote (rotates based on day of year)
    set -l banner_tips \
        "💡 Tip: Use 'abbr' to create command abbreviations" \
        "💡 Tip: Press Alt+E to edit the current command in \$EDITOR" \
        "💡 Tip: Use 'prevd' and 'nextd' to navigate directory history" \
        "💡 Tip: Fish has smart autosuggestions - press → to accept" \
        "💡 Tip: Use 'funced function_name' to edit functions interactively" \
        "💡 Tip: 'cdh' shows your recent directory history" \
        "💡 Tip: Use '**' for recursive globbing (e.g., ls **.txt)"

    set -l banner_day_of_year (date "+%j")
    set -l banner_tip_index (math "($banner_day_of_year % "(count $banner_tips)") + 1")
    echo $banner_magenta"    "$banner_tips[$banner_tip_index]$banner_reset
    echo
    echo $banner_cyan"    ───────────────────────────────────────────────────────"$banner_reset
    echo
end
