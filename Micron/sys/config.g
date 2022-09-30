; Configuration file for BTT Octopus Pro v1.0 F429 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.4.0-LPC-STM32+4 on Tue Sep 06 2022 09:00:27 GMT-0600 (Mountain Daylight Time)

; General preferences
G90                                            ; send absolute coordinates...
M83                                            ; ...but relative extruder moves
M550 P"Goldfinger"                                 ; set printer name
M669 K1                                        ; select CoreXY mode

; Network
M552 S1                                        ; enable network
M586 P0 S1                                     ; enable HTTP
M586 P1 S0                                     ; disable FTP
M586 P2 S0                                     ; disable Telnet

; Display (Fly Screen)
M575 P1 S0 B57600
; Drives
M569 P0.4 S0 D3; V2						       ; Z0 Front Left
M569 P0.5 S1 D3; V2						       ; Z1 Rear Left
M569 P0.6 S0 D3; V2						       ; Z2 Rear Right
M569 P0.7 S1 D3; V2						       ; Z3Front Right
; drive 3 empty
m569 P0.2 S0 D2                                ; E Orbiter2
M569 P0.1 S0 D2							       ; Y (B Motor)
M569 P0.0 S0 D2							       ; X (A Motor)

M584 Y0.0 X0.1 Z0.4:0.5:0.6:0.7 E0.2           ; set drive mapping
M350 X16 Y16 Z16 E16 I1                        ; configure microstepping with interpolation
M92 X100.00 Y100.00 Z400.00 E690.00            ; set steps per mm

M566 X450.00 Y450.00 Z240.00 E300.00           ; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 Z1200.00 E3600.00     ; set maximum speeds (mm/min)
M201 X8000.00 Y8000.00 Z350.00 E600.00         ; set accelerations (mm/s^2)

; Stepper driver currents
; set motor currents (mA) and motor idle factor in per cent
; Drive currents
M906 X800 Y800 Z800 E850 I30                   ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                        ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                               ; set axis minima
M208 X114 Y122 Z105 S0                          ; set axis maxima

; Endstops
M574 X2 S1 P"xstop"                            ; configure switch-type (e.g. microswitch) endstop for high end on X via pin xstop
M574 Y2 S1 P"ystop"                            ; configure switch-type (e.g. microswitch) endstop for high end on Y via pin ystop

; Bed Leveling Data
M671 X-50:-50:170:170 Y-4.5:180:180:-4.5 S20   ; Define Z belts locations (Front_Left, Back_Left, Back_Right, Front_Right)
M557 X15:105 Y30:100 P3                        ; Define bed mesh grid (inductive probe, positions include the Y offset!)


; Z-Probe
M558 P5 C"^zstop" T18000 F600:180 H2 A10 S0.01 ; set Z probe type to KLICKY and the dive height + speeds
G31 P500 X-2.5 Y30 Z0                          ; set Z probe trigger value, offset and trigger height
                     
; Bed Heater
M308 S0 P"bedtemp" Y"thermistor" T100000 B4092 ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                              ; create bed heater output on bed and map it to sensor 0
M307 H0 B0 S1.00                               ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                        ; map heated bed to heater 0
M143 H0 S120                                   ; set temperature limit for heater 0 to 120C
M143 H0 S120                                   ; set temperature limit for heater 0 to 120C

; Tool Heater
M308 S1 P"e0temp" Y"thermistor" T100000 B4092  ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                           ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                               ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                   ; set temperature limit for heater 1 to 280C

; Fans
M950 F0 C"fan0" Q500                           ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                 ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                           ; create fan 1 on pin fan1 and set its frequency
M106 P1 S0 H1 T45                              ; set fan 1 value. Thermostatic control is turned on

; Tools
M563 P0 S"Revo" D0 H1 F0                       ; define tool 0
G10 P0 X0 Y0 Z0                                ; set tool 0 axis offsets
G10 P0 R0 S0                                   ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined
T0
M501
