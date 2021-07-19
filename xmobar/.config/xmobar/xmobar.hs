Config { font = "xft:NotoSansMono Nerd Font:pixelsize=16:antialias=true:autohinting=true:hiting=true"
       , additionalFonts = ["xft:FontAwesome:size=16"]
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
       , commands = [ Run Weather "KUNV" ["-t","<tempC> <fn=0>糖</fn>",
                                          "-L","18","-H","25",
                                          "--normal","green",
                                          "--high","red",
                                          "--low","blue"] 36000
                 -- Network up and down
                 -- , Run Network "eno2" ["-t", "<fn=0>\xf0aa</fn>  <rx>kb  <fn=0>\xf0ab</fn>  <tx>kb"] 20
                 -- , Run Network "eth0" ["-L","0","-H","32",
                 --                       "--normal","green","--high","red"] 10
                 -- , Run Network "wlo1" ["-L","0","-H","32",
                 --                        "--normal","green","--high","red"] 10
                    , Run Cpu ["-L","3","-H","50","-w","3", "-c","0",
                               "--normal","green","--high","red", "-t","\xe716 <vbar>"] 10
--                     , Run MultiCpu ["-L","3","-H","50","-w","3", "-c","0",
--                                "--normal","green","--high","red", "-t","\xe716 <autovbar>"] 10
                    , Run Memory ["-t","<fn=0>\xf85a</fn> <usedratio>%","-c","0"] 10
                    -- , Run Swap ["-p","2"] 10
                    -- , Run Com "uname" ["-s","-r"] "" 36000
                    , Run Date "<fn=0>\xf133</fn> %b %d %Y - (%H:%M) " "date" 50
                    , Run UnsafeStdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       -- , template = " <action=`xdotool key control+alt+g`><icon=haskell_20.xpm/> </action><fc=#666666>  |</fc> %UnsafeStdinReader% } {| %cpu% | %memory% | %KUNV% | <fc=#d65d0e>%date%</fc> "
       , template = " %UnsafeStdinReader% }{| %cpu% | %memory% | <fc=#d65d0e>%date%</fc> "
       }
