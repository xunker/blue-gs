# BlueGS: Internal BlueSCSI for Apple IIgs and Enhanced //e

https://github.com/xunker/blue-gs

<!-- TOC -->

- [BlueGS: Internal BlueSCSI for Apple IIgs and Enhanced //e](#bluegs-internal-bluescsi-for-apple-iigs-and-enhanced-e)
- [About](#about)
- [How it works](#how-it-works)
- [Features](#features)
- [Compatible SCSI cards](#compatible-scsi-cards)
  - [How do I know if my card provides "termination power"? What if it doesn't?](#how-do-i-know-if-my-card-provides-termination-power-what-if-it-doesnt)
- [Performance](#performance)
- [Assembly](#assembly)
- [Installation](#installation)
- [Schematics](#schematics)
- [EDA/Kicad and Gerber Files](#edakicad-and-gerber-files)
- [Credits](#credits)
- [License](#license)

<!-- /TOC -->

# About

*BlueGS* is the internal hard drive your Apple IIgs and //e always *craved*.

Using the [BlueSCSI](https://github.com/erichelgeson/BlueSCSI) SCSI drive emulator and your compatible SCSI card, you have a fully internal hard drive with accessible microSD slot while still keeping your DB-25 connector free for other peripherals.

[![Close-up of BlueGS installed in IIgs slot](images/bluegs_v1.2_rear_installed_cropped_thumb.jpg)](images/bluegs_v1.2_rear_installed_cropped.jpg)
[![BlueGS installed in IIgs slot, right side](images/bluegs_v1.2_rear_installed_right_thumb.jpg)](images/bluegs_v1.2_rear_installed_right.jpg)
[![BlueGS installed in IIgs slot, left side](images/bluegs_v1.2_rear_installed_left_thumb.jpg)](images/bluegs_v1.2_rear_installed_left.jpg)

# How it works

BlueGS connects between your SCSI card and its external DB-25 connector to give you a seamless installation. The BlueGS module itself mounts in a free DB-25 connector cutout in the rear of your IIgs or Enhanced //e.

[![Overhead view of BlueGS in IIgs slot](images/bluegs_v1.2_installed_overhead_thumb.jpg)](images/bluegs_v1.2_installed_overhead.jpg)
[![Frontal view of BlueGS in IIgs slot](images/bluegs_v1.2_installed_front_thumb.jpg)](images/bluegs_v1.2_installed_front.jpg)

# Features

* Gives your Apple IIgs or //e an internal, cable-free hard drive
* Can be powered from SCSI termination power only (if present)
* "Termination Power" mod is not required (when powered from the IIgs internal fan connector)
* Can *provide* termination power to the SCSI bus (when powered from the IIgs internal fan connector)
* Built-in termination that is controlled with a single switch
* TI/Unitrode termination ICs instead of passive termination, reduces power consumption by over 2/3rds
* Connection for external drive activity LED

[![Annotated picture of front of BlueGS v1.2](images/bluegs_v1.2_board_front_annotated_thumb.jpg)](images/bluegs_v1.2_board_front_annotated.jpg)
[![Annotated picture of rear of BlueGS v1.2](images/bluegs_v1.2_board_rear_annotated_thumb.jpg)](images/bluegs_v1.2_board_rear_annotated.jpg)

# Compatible SCSI cards

Tested:
* [GGLabs A2SCSI](https://gglabs.us/node/2071) - a clone of the Apple Rev C SCSI card

Untested, but expected to be compatible:
* Apple Rev C SCSI and clones
* Apple High-Speed SCSI ("Sandwich II")

Unknown, but likely compatible:
* Ramfast SCSI
* Any SCSI card that uses has the same IDC-26/DB-25 pinout as the Apple Rev C SCSI

If you have an SCSI card with an IDC-26/DB-25 connector that has not been tested and would be willing to test your card with BlueGS, please [contact us](https://github.com/xunker/blue-gs/issues) to arrange to have a test unit sent to you.

## How do I know if my card provides "termination power"? What if it doesn't?

Running BlueGS from "termination power" makes installation much easier, but not all SCSI cards have it. For more details, please check out the notes on [Powering BlueGS](POWERING_BLUE-GS.md).

# Performance

Using [BenchmarkD](https://www.brutaldeluxe.fr/products/apple2gs/benchmarked.html) with Apple IIgs (ROM 1, "Fast" speed), GS-RAM Plus w/ 2MB, GGLabs A2SCSI card.

* Read
  * File: 52 KB/s
  * Block-by-block: 36 KB/s
  * With 64K buffer: 79 KB/s
* Write (File): 37 KB/s

# Assembly

If you purchased BlueGS as a self-assemble kit or are using your own PCBs, please follow the instructions in the "[assembly](assembly/)" directory.

If your BlueGS was purchased fully-assembled, please move on to the "[Installation](installation/)" section.
# Installation

Installation guides can be found in the "[installation](installation/)" directory.
# Schematics

[V1.3 Schematic](schematics/schematic_v1.3.pdf) (**non-final**, subject to change)

[V1.2 Schematic](schematics/schematic_v1.2.pdf)

[V1.1 Schematic](schematics/schematic_v1.1.pdf)

# EDA/Kicad and Gerber Files

Kicad of current design can be found in [kicad](kicad/) directory.

Gerber files for v1.2 can be found in the [gerbers/v1.2](gerbers/v1.2) directory. **Note:** v1.2 has bugs and it not recommended for general use. V1.3 will be available shortly which will address these bugs.

# Credits

This project would not be possible without the work done by [ztto](https://github.com/ztto/ArdSCSino-stm32), [Tambo](https://twitter.com/h_koma2), [Eric Helgeson](https://github.com/erichelgeson/BlueSCSI), and many others.

The "Blue Pill" footprint was originally created by [Yet-Another-Average-Joe](https://github.com/yet-another-average-joe/Kicad-STM32).

Symbol and footprint for Molex 105162-0001 MicroSD slot created by [SnapEDA user HMantz](https://www.snapeda.com/parts/105162-0001/Molex/view-part/).

External LED driver circuit credit to @akuker on Open Retro SCSI Discord.

# License

See [LICENSE.md](LICENSE.md).
