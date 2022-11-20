# 1.4
## Component Changes

### Replace 12v aux power with 5v

This change is for two reasons:

1) The 7805 regulator is wasteful, especially when the IIgs only has 2.5a on the 12v rail
2) The Apple IIe doesn't have a fan connector

The fix for this will be to get 5v directly from the Game IO (Paddle) Port, a direct tap on the 5V power supply wire, or from a card slot.

This 5v will be used directly via an IC that performs reverse current and over-current protection.

## Layout Changes

For a brighter LED, you have the option to choose 
# 1.3.2

Move External LED connector closer to edge to clear cable plugged in to J1.

Change footprint of D3/D4 to "Diode_SMD:D_SOD-123".

Increase width of 12V and 5V traces.

Move SD Card 3.3v trace to bottom.

Slightly move screw terminal offset to avoid clipped silkscreen warning.

# Older changes not recorded
