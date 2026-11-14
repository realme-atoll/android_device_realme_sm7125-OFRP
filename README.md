![OFRP](https://i.ibb.co/4WgF7pR/banner-2.png "OFRP")

OrangeFox Recovery Project (OFRP) R12.0 for realme 6 Pro, 7 Pro & 8 Pro (sm7125)
===================================================================================

# Unified Support - OrangeFox R12.0
This unified branch includes the latest OrangeFox R12.0 with full support for **realme 6 Pro (RMX2061)**, **realme 7 Pro (RMX2170)**, and **realme 8 Pro (RMX3081)**:
- **OrangeFox R12.0** - Latest stable version (March 2026)
- **Unified support**: Automatically detects device model and applies dynamic cutout and status bar offsets
- **Android Support**: Multi-version Android support with latest security patches
- **Magisk v30.7** - Latest stable (February 2026)
- **KernelSU v3.2.5** - Latest stable (June 2026)
- **KernelSU Next v3.3.0** - Latest stable (July 2026)
- **APatch** support (latest)
- **FBE v2** with metadata encryption

## OrangeFox R12.0 Features
- Complete interface overhaul with Material Expressive design
- New SVG icons and themes (Fox white, Fox dark)
- Dynamic hole-punch cutout calibration for single-hole (7 Pro / 8 Pro) and dual-hole (6 Pro) displays
- HW GUI controls for devices with touch issues
- Support for Android 14/15/16/17 ROMs
- APatch and KernelSU root modules support
- USB mouse navigation support
- Advanced File Manager with batch operations
- Password protection
- Built-in Magisk/KernelSU/APatch installer
- LZ4 and ZSTD compression support
- Decryption support for Android 16 with PIN/password

# How to build
Check OFRP official guide https://wiki.orangefox.tech/en/dev/building

```bash
# Set up build environment
. build/envsetup.sh
lunch twrp_sm7125-eng
mka recoveryimage -j$(nproc --all)
```

## Device specifications

| Feature | realme 6 Pro (RMX2061) | realme 7 Pro (RMX2170) | realme 8 Pro (RMX3081) |
| :--- | :--- | :--- | :--- |
| **SoC** | Qualcomm SM7125 Snapdragon 720G | Qualcomm SM7125 Snapdragon 720G | Qualcomm SM7125 Snapdragon 720G |
| **CPU** | Octa-core (2x2.3 GHz Kryo 465 Gold & 6x1.8 GHz Kryo 465 Silver) | Octa-core (2x2.3 GHz Kryo 465 Gold & 6x1.8 GHz Kryo 465 Silver) | Octa-core (2x2.3 GHz Kryo 465 Gold & 6x1.8 GHz Kryo 465 Silver) |
| **GPU** | Adreno 618 | Adreno 618 | Adreno 618 |
| **Memory** | 6/8 GB RAM | 6/8 GB RAM | 6/8 GB RAM |
| **Storage** | 64/128 GB UFS 2.1 | 128 GB UFS 2.1 | 128 GB UFS 2.1 |
| **Battery** | 4300 mAh (30W VOOC 4.0) | 4500 mAh (65W SuperDart) | 4500 mAh (50W SuperDart) |
| **Display** | 6.6" 90Hz IPS LCD (1080 x 2400) | 6.4" Super AMOLED (1080 x 2400) | 6.4" Super AMOLED (1080 x 2400) |
| **Cutout** | Dual Punch-hole Pill (Left) | Single Punch-hole (Left) | Single Punch-hole (Left) |

---
## Copyright notice
```
/*
*  Copyright (C) 2020-2026 The OrangeFox Recovery Project
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*
*/
```
