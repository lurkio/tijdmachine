# De Tijdmachine by Gerton A Lunter: an English translation for the BBC Micro

## Introduction
[De Tijdmachine](http://www.solutionarchive.com/game/id%2C3715/Tijdmachine%2C+De.html) is a Dutch text adventure game based on HG Wells's 1895 novella [The Time Machine](https://en.wikipedia.org/wiki/The_Time_Machine). 

The game was (originally?) written in [BASICODE](https://github.com/robhagemans/basicode) in the 1980s. I've translated the [BBC Micro](https://en.wikipedia.org/wiki/BBC_Micro) version of the game into English.

\>\>\>\> [**Play the game online**](http://bbcmicro.co.uk/game.php?id=3407) <<<<

## History
I received the Dutch version of the game from [Garry @ CASA](http://www.solutionarchive.com/phpBB3/viewtopic.php?f=3&t=1421#p9751). It was written in BASICODE that had already been customised for [BBC BASIC](https://en.wikipedia.org/wiki/BBC_BASIC) for the BBC Micro computer. So all I had to do was translate the Dutch text into English. The one slight problem was that I don't speak any Dutch! But that's where Google Translate came in very handy...

## Implementation
The game program consists of only one file ([Tijdmachine, De (Gerton A Lunter).bas](https://github.com/lurkio/tijdmachine/blob/master/Tijdmachine%2C%20De%20(Gerton%20A%20Lunter).bas)). In that file, my English translations are interleaved with the original Dutch text. Since each English line always comes *after* the original Dutch line of which it's a translation, the entire contents of the file can be copied and pasted into an emulator (such as [BeebEm](http://www.mkw.me.uk/beebem/)) and the resulting program will run correctly because the English lines will "override" the Dutch ones.   
