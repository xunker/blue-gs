# 1.4

## Replace 12v aux power with 5v

This change is for two reasons:

1) The 7805 regulator is wasteful, especially when the IIgs only has 2.5a on the 12v rail
2) Some models of Apple IIe don't have a fan connector, and most II/II+'s don't

The fix for this will be to get 5v directly from the Game IO (Paddle) Port, a direct tap on the 5V power supply wire, or from a card slot.

This 5v will be used directly via an IC that performs reverse current and over-current protection.

## Branding Changes

The current design has been retroactively branded "BlueGS / BP" to distinguish it from the upcoming RP2040-based "BlueGS / RP"

# 1.3.2

Move External LED connector closer to edge to clear cable plugged in to J1.

Change footprint of D3/D4 to "Diode_SMD:D_SOD-123".

Increase width of 12V and 5V traces.

Move SD Card 3.3v trace to bottom.

Slightly move screw terminal offset to avoid clipped silkscreen warning.

# Older changes not recorded
