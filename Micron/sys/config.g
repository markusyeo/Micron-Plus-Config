; Configuration file for Duet 3 Mini 5+ (firmware version 3.3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.3.16 on Fri Dec 08 2023 11:13:40 GMT+0800 (Singapore Standard Time)

G4 S2                                                                ; wait for expansion boards to start
; General preferences
G90                                                                  ; send absolute coordinates...
M83                                                                  ; ...but relative extruder moves
M550 P"Micron+"                                                      ; set printer name
M669 K1                                                              ; select CoreXY mode

; Network
M552 S1                                                              ; enable network
M586 P0 S1                                                           ; enable HTTP
M586 P1 S0                                                           ; disable FTP
M586 P2 S0                                                           ; disable Telnet

; Drives
M569 P0.3 S1                                                         ; Z0 Front Left
M569 P0.1 S0                                                         ; Z1 Rear Left
M569 P0.0 S1                                                         ; Z2 Rear Right
M569 P0.2 S0                                                         ; Z3 Front Right
; driver 4 empty    
M569 P121.0 S0                                                       ; E Sherpa
M569 P0.6 S1 D3 V40                                                  ; Y (B Motor)
M569 P0.5 S1 D3 V40                                                  ; X (A Motor)

M584 Y0.6 X0.5 Z0.3:0.1:0.0:0.2 E121.0                               ; set drive mapping
M350 X16 Y16 Z16 E16 I1                                              ; configure microstepping with interpolation
M92 X100.00 Y100.00 Z400.00 E705.50                                  ; set steps per mm

M566 X450.00 Y450.00 Z240.00 E300.00                                 ; set maximum instantaneous speed changes (mm/min)
M203 X15000.00 Y15000.00 Z1200.00 E3600.00                           ; set maximum speeds (mm/min)
M201 X4000.00 Y4000.00 Z350.00 E600.00                               ; set accelerations (mm/s^2)

; Stepper driver currents
; set motor currents (mA) and motor idle factor in per cent
; Drive currents
M906 X1000 Y1000 Z800 E600 I30                                       ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                                              ; Set idle timeout

; Axis Limits
M208 X0 Y-10 Z-10 S1                                                 ; set axis minima
M208 X180 Y186 Z180 S0                                               ; set axis maxima

; Endstops
M574 X2 S3                                                           ; configure sensorless endstop for high end on X
M574 Y2 S3                                                           ; configure sensorless endstop for high end on Y

; Bed Leveling Data
M671 X-45:-45:225:225 Y-7:231:231:-7 S20                             ; Define Z belts locations (Front_Left, Back_Left, Back_Right, Front_Right)

; Z-Probe
M558 K0 P8 C"^121.io0.in" T12000 F600:180 H3 A10 S0.005              ; set Z probe type to KLICKY and the dive height + speeds
G31 P500 X0 Y30 Z0                                                   ; set Z probe trigger value, offset and trigger height
M557 X15:165 Y35:165 P6:6                                            ; Define bed mesh grid (inductive probe, positions include the Y offset!)
                     
; Bed Heater
M308 S0 P"temp0" Y"thermistor" T100000 B3950 A"Heater Bed"           ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"out1" T0 Q10                                               ; create bed heater output on out0 and map it to sensor 0 PWM 5Hz SSR
M307 H0 B0 S1.00                                                     ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                              ; map heated bed to heater 0
M143 H0 S120                                                         ; set temperature limit for heater 0 to 120C

; Tool Heater
M308 S1 P"121.temp1" Y"thermistor" T100000 B4725 C7.06e-8  A"Nozzle" ; configure sensor 1 as PT1000 on pin 121.temp0
M950 H1 C"121.out0" T1                                               ; create nozzle heater output on 121.out0 and map it to sensor 1
M307 H1 B0 S1.00                                                     ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S300     

; Chamber thermistor
M308 S2 P"121.temp0" Y"thermistor" T100000 B3950 A"Chamber"

; Fans
M950 F0 C"out5" Q500                                                 ; create fan 0 on pin out5 and set its frequency
M106 P0 C"Electronics Fan 1" S0.25 H-1                               ; set fan 0 name and value. Thermostatic control is turned off
M950 F1 C"out6" Q500                                                 ; create fan 1 on pin out6 and set its frequency
M106 P1 C"Electronics Fan 2" S0.25 H-1                               ; set fan 1 name and value. Thermostatic control is turned off
M950 F2 C"121.out1" Q500                                             ; create fan 2 on pin 121.out1 and set its frequency
M106 P2 C"Partcooling Fan" S0 H-1                                    ; set fan 2 name and value. Thermostatic control is turned off
M950 F3 C"121.out2" Q500                                             ; create fan 3 on pin 121.out2 and set its frequency
M106 P3 C"Heatsink Fan" S0 H1 T45                                    ; set fan 3 name and value. Thermostatic control is turned on
M950 F4 C"out3" Q500                                                 ; create fan 4 on pin ou3 and set its frequency
M106 P4 C"3DPF" S0 H-1                                               ; set fan 4 name and value. Thermostatic control is turned off

; Tools
M563 P0 S"Hotend" D0 H1 F2                                           ; define tool 0
G10 P0 X0 Y0 Z0                                                      ; set tool 0 axis offsets
G10 P0 R0 S0                                                         ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined
T0
M501