; homeall.g
; called to home all axes

M400                   ; make sure everything has stopped before we change the motor currents
M915 H200 X Y S2 R0 F0 ; set X and Y to sensitivity 2, do nothing when stall, unfiltered
M913 X40 Y40           ; drop motor currents to 40%

G91                    ; use relative positioning
G1 H2 X1.0 Y1.0 F300   ; energise motors and move them 1mm in the +X direction to ensure they are not stalled
G1 H2 Z3 F5000         ; lift Z 3mm
G1 H1 X200 F3000       ; move to the back up to 200mm, stopping at the endstop
G1 X-5 F2000           ; move away from end
G1 H1 X200 F3000       ; move to the back up to 200mm, stopping at the endstop
G1 X-2 F2000           ; move away from end
G1 H1 Y200 F3000       ; move to the back up to 200mm, stopping at the endstop
G1 Y-5 F2000           ; move away from end
G1 H1 Y200 F3000       ; move to the back up to 200mm, stopping at the endstop
G1 Y-2 F2000           ; move away from end
G1 H2 Z-3 F1200        ; lower Z
G90                    ; back to absolute positioning

M400                   ; make sure everything has stopped before we reset the motor currents
M913 X100 Y100         ; motor currents back to 100%
M98 P"/sys/homez.g"
