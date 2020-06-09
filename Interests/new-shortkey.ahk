; CapsLock + ijkl
CapsLock & i:: Send {Pgup}
CapsLock & k:: Send {Pgdn}
CapsLock & j:: Send {home}
CapsLock & l:: Send {end}

; CapsLock + wasd
CapsLock & w:: Send {up}
CapsLock & s:: Send {down}
CapsLock & a:: Send {left}
CapsLock & d:: Send {right}

; CapsLock + [] (windows virual desktop switcher)
CapsLock & [:: Send ^#{left}
CapsLock & ]:: Send ^#{right}

; CapsLock + space --> Enter
CapsLock & space:: Enter

; f + ijkl --> shift + ...
f & i:: Send +{up}
f & k:: Send +{down}
f & j:: Send +{left}
f & l:: Send +{right}

; short message
::/qm::2714616793@qq.com
::/pn::13281838740
::/py::python3

; Ctrl+shift+c  copy file path
^+c::
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,

return