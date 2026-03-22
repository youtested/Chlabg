# Chemist-Pro Flame Power Control - Complete Guide

## What Was Done

1. **Decompiled** the Chemist.swf using JPEXS FFDec
2. **Modified iHeater.as** with flame power control code
3. **Exported full XFL project** for recompilation

## Files Available

| File | Contents |
|------|----------|
| `modified_source_package.zip` | Everything you need |
| `fla_project/` | Full XFL project |
| `decompiled/scripts/iHeater.as` | Modified heater code |

## How to Add Flame Power Slider (Step by Step)

### Option A: Use Adobe Animate (Easiest)

1. Download `modified_source_package.zip` and extract
2. Open **Adobe Animate CC**
3. File → Open → Select folder `fla_project/Chemist_uncompressed/`
4. In Animate, locate **iHeater.as** in the Library
5. Replace the code with contents of `modified_source/iHeater/iHeater.as`
6. Add a slider (iNumberSlider component) to the heater control UI
7. Connect the slider to call `heater.setFlamePower(slider.N / 100)`
8. File → Publish → Export as SWF

### Option B: Use FFDec + Flex SDK (Free)

1. Download Apache Flex SDK 4.16.1
2. Set config: `ffdec.sh -config airLibLocation=/path/to/flex-sdk`
3. Run: `ffdec.sh -importScript modified_source/iHeater Chemist_uncompressed.swf output.swf`

## What the Code Does

```actionscript
// In iHeater class:
public var flamePower:Number = 1.0;  // 0.1 to 1.0

// Heating formula becomes:
iHt = Math.round(this.MaxCap * this.flamePower * Math.exp(-dis * dis / 30000));
```

## Alternative: Use Multiple Burners

The current APK already has **15 burners** with different temperatures:
- Gas Burner 100C, 200C, 300C... up to 1500C

Select different burners from the lab menu to control heat output.

## Current APK Download

https://github.com/youtested/Chlabg/releases/download/v6.1-enhanced/Chemist-Pro-v6.1-controllable-burner.apk
