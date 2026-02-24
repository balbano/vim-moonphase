vim9script

set laststatus=2 # Make statusline persistent

# Calcs from moonphase.sh by Kevin Boone http//github.com/kevinboone/moonphase.sh

def g:Moon_percent(): number
    var ref_date = '2023-01-15'
    var ref_percent = 75

    var sec_per_day = 86400
    var synodic_seconds = 2551443

    var ref_epoch = strptime('%Y-%m-%d', ref_date)
    var now_epoch = strptime('%s', strftime('%s')) # It feels like there should be a better way to do this

    var sec_diff = now_epoch - ref_epoch
    var centi_moons = 100 * sec_diff / synodic_seconds # This is a hack we may not need from the original script
    return (centi_moons + ref_percent) % 100
enddef

def g:Moon_emoji(percent: number): string
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

set statusline=%=%{Moon_emoji(Moon_percent())}
