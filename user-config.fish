command -v oh-my-posh &> /dev/null && oh-my-posh init --config "$HOME/.config/caelestia/zen.toml" fish | source

# Better ls
command -v lsd &> /dev/null && alias ls='lsd --group-directories-first'

abbr l 'ls'
abbr ll 'ls -l'
abbr la 'ls -a'
abbr lla 'ls -la'
abbr ltd 'ls --tree --directory-only'
abbr ltf 'ls --tree'

clear

function center
    set cols (tput cols)

    set lines
    set max_width 0

    while read -l line
        if test -z "$line"
            continue
        end

        set -a lines "$line"

        set clean (string replace -ra '\e\[[0-9;]*m' '' -- "$line")
        set width (string length -- "$clean")

        if test $width -gt $max_width
            set max_width $width
        end
    end

    set pad (math "floor(max(0, ($cols - $max_width) / 2))-1")

    for line in $lines
        printf "%*s%s\n" $pad "" "$line"
    end
end

function horizontal_rule
    string repeat -n (tput cols) "─"
    echo
end

function fish_greeting
    printf "%s\n" \
        "███████╗ ██████╗ ██╗   ██╗██╗灵魂  " \
        "██╔════╝██╔═══██╗██║da ██║██║士兵  " \
        "███████╗██║no ██║██║em ██║██║国王  " \
        "╚════██║██║me ██║██║on ██║██║没了  " \
        "███████║╚██████╔╝╚██████╔╝███████╗ " \
        "╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝ " | center

    if command -q fastfetch
        fastfetch | center
    end

    if command -q fortune
        set fortune_text (fortune)

        horizontal_rule

        for line in $fortune_text
            if string match -qr '^\s*(--|—)' -- "$line"
                set_color yellow
            else if string match -qr '\?$' -- "$line"
                set_color magenta
            else
                set_color brcyan
            end

            echo "$line" | center
        end

        set_color normal
    end
end
