Config { font = "xft:JetBrainsMono Nerd Font:pixelsize=16:antialias=true:hiting=true"
       , additionalFonts = []
       , borderColor = "black"
       , border = TopB
       , bgColor = "black"
       , fgColor = "grey"
       , alpha = 255
       , position = TopSize L 100 30
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run Weather "KUNV" ["-t","<station>: <tempC>C",
                                          "-L","18","-H","25",
                                          "--normal","green",
                                          "--high","red",
                                          "--low","blue"] 36000
                  --   , Run Network "eth0" ["-L","0","-H","32",
                    --                       "--normal","green","--high","red"] 10
                    -- , Run Network "wlo1" ["-L","0","-H","32",
                   --                        "--normal","green","--high","red"] 10
                    , Run Cpu ["-L","3","-H","50", "-p","2",
                               "--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%", "-p","2"] 10
                    , Run Swap ["-p","2"] 10
                    -- , Run Com "uname" ["-s","-r"] "" 36000
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% } { %cpu% | %memory% * %swap% |\
                    \ %KUNV% | <fc=#d65d0e>%date%</fc> "
       }