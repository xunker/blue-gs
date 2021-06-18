# Powering BlueGS

<!-- TOC -->

- [Powering BlueGS](#powering-bluegs)
- [Ways to power BlueGS](#ways-to-power-bluegs)
  - [Termination Power from SCSI card](#termination-power-from-scsi-card)
  - [Termination Power from another SCSI device](#termination-power-from-another-scsi-device)
  - [+12V from the IIgs fan connector](#12v-from-the-iigs-fan-connector)
  - [USB port on Blue Pill board](#usb-port-on-blue-pill-board)
- [What is Termination Power?](#what-is-termination-power)
- [What SCSI cards do/don't provide Termination Power?](#what-scsi-cards-dodont-provide-termination-power)
  - [Cards that DO provide Termination Power](#cards-that-do-provide-termination-power)
  - [Cards that DON'T provide Termination Power](#cards-that-dont-provide-termination-power)
  - [Unknown cards](#unknown-cards)
- [How can I tell if my SCSI card is providing Termination Power?](#how-can-i-tell-if-my-scsi-card-is-providing-termination-power)
- [Why can't I use USB while BlueGS is powered from SCSI or +12V?](#why-cant-i-use-usb-while-bluegs-is-powered-from-scsi-or-12v)

<!-- /TOC -->

# Ways to power BlueGS

There are 4 ways to power your BlueGS board, listed here from "most easy" to "least easy".

## Termination Power from SCSI card

If your SCSI card provides [Termination Power](#what-is-termination-power), then all you need to is connect BlueGS to your SCSI card using the included flat 26-pin cable. No additional steps are required, and BlueGS should turn on the moment that the computer is powered up.

## Termination Power from another SCSI device

If your SCSI card does not provide Termination Power, then you can provide the necessary power through another SCSI device connected to the DB-25 connector.

Most external SCSI devices will provide the necessary Termination Power. To power BlueGS this way:
* Connect the new SCSI device to the DB-25 connector
* On BlueGS, switch "Termination" to "off"
* Ensure that the new SCSI device is terminated, either via a switch (if it has one, such as on the IOmega Zip Drive) or an external terminator that connects to one of the SCSI ports of the device.

This external device must be powered-on *before* the IIgs turns on.

## +12V from the IIgs fan connector

You can power BlueGS using the IIgs's internal fan connector (or any other source that can provide from 6V DC to 12V DC).

If you power BlueGS using this connector, it will also send termination power to any other devices on the SCSI bus that may need it -- such as another BlueSCSI device!

**Note for v1.2 users**:

If you are using V1.2 of the board, it is recommended that you do **NOT** use 12V aux power for an extended period of time without attaching a heat sink to the regulator on BlueGS (chip labeled "AMS1117"). This warning does not apply v1.3 or higher of BlueGS.

## USB port on Blue Pill board

You can power BlueGS using the USB connector on the Blue Pill module as long as you are not also using SCSI Termination Power or 12V aux power.

# What is Termination Power?

Very briefly, "Termination Power" is electrical current that is used to power devices called "Terminators". A "Terminator" is a device connected to the end of a "bus" (the cable/wire) to show where the end is.

If you think of the SCSI bus as a water pipe and each drive on the bus as a water tap connected to the pipe, then a Terminator is the cap at the end of the pipe.

# What SCSI cards do/don't provide Termination Power?

While many SCSI cards do not provide termination power, there are some that can be modified to that they will.

## Cards that DO provide Termination Power

* [GGLabs A2SCSI](https://gglabs.us/node/2071)
* RAMFast SCSI - controlled by JP1 or DIP #1, see manual for details

## Cards that DON'T provide Termination Power

* Apple Rev B SCSI
  - Can be modified to provide termination power
* Apple Rev C SCSI
  - Can be modified to provide termination power
* Apple High-Speed SCSI ("Sandwich II")
  - Can be modified to provide termination power

## Unknown cards

* AMR SCSI
* CMS SCSI II
* Cirtech SCSI/InSyder
* GSE-Reactive SCSI Card
* SVA Hard Disk Adapter

# How can I tell if my SCSI card is providing Termination Power?

If your card is not in one of the lists above, then the easiest way is to connect BlueGS and see if it turns on when the the computer is powered on.

If you have a multi-meter, you can check the voltage on pin 25 of the DB-25 connector. If termination power is provided, this pin should read between 4.5 and 5 volts.

# Why can't I use USB while BlueGS is powered from SCSI or +12V?

There is a design flaw on the Blue Pill board where power sent to the +5V pin of the board can then be sent *back* through the USB connector. This "backfeed" or "backflow" can potentially cause damage to whatever is providing USB power and so it strongly recommended that you do not use USB to power BlueGS while connected to SCSI Termination Power or 12v aux power.

If your SCSI card does not provide Termination Power and BlueGS is not using the 12v aux power connector, then there is no danger of "backfeed" and USB power can be used.
