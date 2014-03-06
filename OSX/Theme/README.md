# SArtFile.bin

There are two versions of each `png` image.

- `-1` is the 2x version for use on regular displays.
- `-2` is a 2x version for use on retina displays.

You only need to edit the version you want to use.

**Random Bullet**

- 6

**Dots for resize tab**

- 7
- 8
- 9
- 10

**Apple logo for menubar**

- 11 (normal state)
- 12 (selected state)

**Menubar**

- 109 (background)
- 49 (selected item background)
- 50 (not sure - possibly the disabled version)

**Window Border Radius Masks**

If you fill the png with a solid colour, you will get square corners.

- 54 (bottom left)
- 56 (bottom right)
- 89 (top left)
- 91 (top right)

**Window Titlebar Bottom**

> Actually I have no idea. Maybe I need to logout.

- 51
- 53
- 55

**Window Titlebar Top**

You can edit these to replace the window titlebar background.\

Just fill them with a solid colour, and increase the height to around 200px.

You can also adjust the width if you need to.

- 86 - Middle
- 88 - Left
- 90 - Right

**Edge selector (right click selection)**

> Couldn't get this working

- 107
- 108

**Spotlight**

- 110
- 111

**Full Screen Arrows**

- 329-1.pdf


# ArtFile.bin

## Traffic Lights

*Active + Not focused*

> e.g. When you have quicklook open

**Close**

Active + focused: `titlebarcontrols.active.close.colorsryg.regularwin`

Active + not focused: `titlebarcontrols.activenokey.close.colorsryg.regularwin`

Inactive: `titlebarcontrols.close.colorsryg.inactive.regularwin`

Rollover: `titlebarcontrols.close.colorsryg.regularwin.rollover`

Pressed: `titlebarcontrols.close.colorsryg.regularwin.pressed`

Disabled: `titlebarcontrols.close.colorsryg.disabled.regularwin`

**Close + Unsaved Changes**

Active + focused: `titlebarcontrols.active.closedirty.colorsryg.regularwin`

Active + not focused: `titlebarcontrols.activenokey.closedirty.colorsryg.regularwin`

Inactive: `titlebarcontrols.closedirty.colorsryg.inactive.regularwin`

**Minimize**

Active + focused: `titlebarcontrols.active.colorsryg.minimize.regularwin`

Active + not focused: `titlebarcontrols.activenokey.colorsryg.minimize.regularwin`

Inactive: `titlebarcontrols.colorsryg.inactive.minimize.regularwin`

Rollover: `titlebarcontrols.colorsryg.minimize.regularwin.rollover`

Pressed: `titlebarcontrols.colorsryg.minimize.pressed.regularwin`

Disabled: `titlebarcontrols.colorsryg.disabled.minimize.regularwin`

**Maximize**

Active + focused: `titlebarcontrols.active.colorsryg.regularwin.zoom`

Active + not focused: `titlebarcontrols.activenokey.colorsryg.regularwin.zoom`

Inactive: `titlebarcontrols.colorsryg.inactive.regularwin.zoom`

Rollover: `titlebarcontrols.colorsryg.regularwin.rollover.zoom`

Pressed: `titlebarcontrols.colorsryg.regularwin.pressed.zoom`

Disabled: `titlebarcontrols.colorsryg.disabled.regularwin.zoom`
