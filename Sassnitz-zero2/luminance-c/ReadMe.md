# Luminance command

A small (!) binary that can tell you the average luminance of a JPEG image.

## Setup

The C code depends on libjepg: 
 * `apt install libjpeg-dev`
 * `dnf install lipjpeg-devel`

On e.g. Fedora you might also need something like this for a general start to C compiling: `dnf group install c-development development-tools`

## Build


As a stand-alone binary, hardlinked to libjpeg:
```
gcc luminance.c -o luminance -ljpeg -O2

# for RasPi (Zero 2 in the given case) the following produced a viable executable:

gcc -mcpu=cortex-a53 -mfpu=neon-vfpv4  luminance.c -o luminance -ljpeg -O2
```
