vim9script

set laststatus=2 # Make statusline persistent

# Calcs from moonphase.sh by Kevin Boone http//github.com/kevinboone/moonphase.sh

# moonphase.sh uses 'centi_moons' to calculate the moon phase as a percent,
# because the shell script only can do integer math. Since vimscript can do
# floats, we could probably rewrite this to be both more straightforward and
# more accurate.
def g:MoonPercent(): number
    var ref_date = '2023-01-15'
    var ref_percent = 75

    var sec_per_day = 86400
    var synodic_seconds = 2551443

    var ref_epoch = strptime('%Y-%m-%d', ref_date)
    var now_epoch = strptime('%s', strftime('%s')) # It feels like there should be a better way to do this

    var sec_diff = now_epoch - ref_epoch
    var centi_moons = 100 * sec_diff / synodic_seconds 

    return (centi_moons + ref_percent) % 100
enddef

# If this function accepted an array of strings, containing the emojis for
# example, it would be easy to swap it for an array of Nerd Font icons, etc.
# It might even make sense to rewrite the function to return a number that
# could be used to directly index the array, rather than the long if
# statement, as long as we maintained the way the new moon wraps around the
# beginning and end of the range.
def g:MoonEmoji(percent: number): string
    if percent < 7
        return '🌑'
    elseif percent < 19
        return '🌒'
    elseif percent < 32
        return '🌓'
    elseif percent < 44
        return '🌔'
    elseif percent < 57
        return '🌕'
    elseif percent < 69
        return '🌖'
    elseif percent < 82
        return '🌗'
    elseif percent < 94
        return '🌘'
    else
        return '🌑'
    endif
enddef

set statusline=%=%{MoonEmoji(MoonPercent())}
