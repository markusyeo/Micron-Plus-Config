if sensors.probes[0].value[0] == 1000
  M564 H1
  G90
  G1 X20 Y100 F3000
  G1 Y123
  G1 Y160
  M400
  if sensors.probes[0].value[0] == 1000
    abort "Probe attach failed"
G1 X80 Y50