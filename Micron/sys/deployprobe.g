if sensors.probes[0].value[0] == 0
  M564 H1
  G90
  G1 X62 Y130 F3000
  G1 Y185
  G1 X112
  M400
  if sensors.probes[0].value[0] == 0
    abort "Probe detach failed"
G1 X90 Y50