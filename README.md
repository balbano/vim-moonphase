# Goodnight Moon

I got suckered into learning vimscript because someone made a joke on Discord and I spent the evening kludging my way around with adding the current moonphase to Vim! I used the calculations from [moonphase.sh](https://github.com/kevinboone/moonphase.sh) by Kevin Boone, which I find endlessly charming. I think implementing the moonphase emoji display is now my next step after "Hello, World!" when learning a language.

Executing `:source` in moonphase.vim will set your status bar to the current moonphase.

Next steps:

- Rewrite it to take advantage of the fact that vimscript has floats
- Make it a plugin! Or make it integrate with vim-airline or something!

Vimscript is fun!
