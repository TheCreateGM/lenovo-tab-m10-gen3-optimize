# Lenovo Tab M10 (3rd Gen) Performance & Network Optimizer

A comprehensive bash script that optimizes network speed, hotspot stability, and overall device performance for the Lenovo Tab M10 (3rd Gen) tablet using ADB (Android Debug Bridge).

## Features

### Network & Hotspot Enhancement
- **Network Stack Reset**: Clears network caches by toggling Wi-Fi connections
- **Private DNS Configuration**: Automatically sets Cloudflare DNS (1.1.1.1) for faster and more secure lookups
- **Background Scan Optimization**: Disables unnecessary background Wi-Fi scanning to improve stability and battery life
- **Hotspot Stability**: Optimizes tethering offload settings for more reliable hotspot connections

### UI & Graphics Performance
- **GPU Acceleration**: Forces GPU rendering for 2D operations, resulting in smoother UI animations
- **Animation Speed Optimization**: Reduces animation scales to 0.5x for a snappier, more responsive interface

### System & Battery Optimization
- **Resource Management**: Reduces logger buffer size to free up memory and reduce CPU overhead
- **Battery Calibration**: Recalibrates battery statistics for more accurate battery readings

## Requirements

- **ADB (Android Debug Bridge)**: Must be installed and accessible in your system PATH
- **USB Debugging**: Must be enabled on your Lenovo Tab M10
- **USB Connection**: Device must be connected via USB cable
- **No Root Required**: This script works without rooting your device

## Installation

1. **Install ADB**:
   - **Windows**: Download Android SDK Platform-Tools from the official Android website
   - **macOS**: `brew install android-platform-tools`
   - **Linux**: `sudo apt install adb` (Ubuntu/Debian) or `sudo pacman -S android-tools` (Arch)

2. **Download the Script**:
   ```bash
   curl -O https://raw.githubusercontent.com/TheCreateGM/lenovo-tab-m10-gen3-optimize/refs/heads/main/lenovo.sh
   # or
   wget https://raw.githubusercontent.com/TheCreateGM/lenovo-tab-m10-gen3-optimize/refs/heads/main/lenovo.sh
   ```

3. **Make it Executable**:
   ```bash
   chmod +x lenovo.sh
   ```

## Setup Your Device

1. **Enable Developer Options**:
   - Go to Settings → About tablet
   - Tap "Build number" 7 times
   - Developer options will now be available in Settings

2. **Enable USB Debugging**:
   - Go to Settings → System → Developer options
   - Enable "USB debugging"

3. **Connect Your Device**:
   - Connect your tablet to your computer via USB
   - When prompted on your tablet, tap "Allow" to authorize USB debugging

## Usage

1. Connect your Lenovo Tab M10 to your computer via USB
2. Run the script:
   ```bash
   ./lenovo.sh
   ```
3. Wait for the optimization process to complete (approximately 30-45 seconds)
4. Reboot your device when prompted for best results

## What the Script Does

The script performs the following operations safely via ADB:

```bash
# Network optimizations
- Toggles Wi-Fi to clear connection caches
- Configures private DNS to 1dot1dot1dot1.cloudflare-dns.com
- Disables wifi_scan_always_enabled
- Enables tether offload for hotspot stability

# UI optimizations
- Enables force_gpu_rendering
- Sets animation scales to 0.5x

# System optimizations
- Reduces logger buffer to 256KB
- Resets battery statistics
```

## Safety & Disclaimer

- ✅ **Safe**: All commands are non-destructive and reversible
- ✅ **No Root Required**: Works on stock, unrooted devices
- ✅ **Tested**: Designed specifically for Lenovo Tab M10 (3rd Gen)
- ⚠️ **Use at Your Own Risk**: While generally safe, the author is not responsible for any issues

## Troubleshooting

### "adb command not found"
- Install Android SDK Platform-Tools
- Ensure ADB is in your system PATH

### "No device found"
- Check USB connection
- Verify USB Debugging is enabled
- Try a different USB cable or port
- Run `adb devices` to check if device is recognized

### Device Not Authorized
- Check your tablet screen for an authorization prompt
- Tap "Always allow from this computer" and then "Allow"

### Changes Not Taking Effect
- Reboot your device after running the script
- Some changes may require a few minutes to fully apply

## Reverting Changes

To revert the optimizations, you can manually reset settings:

```bash
# Revert to default DNS
adb shell settings put global private_dns_mode off

# Re-enable background Wi-Fi scanning
adb shell settings put global wifi_scan_always_enabled 1

# Reset animation scales to default
adb shell settings put global window_animation_scale 1.0
adb shell settings put global transition_animation_scale 1.0
adb shell settings put global animator_duration_scale 1.0

# Disable GPU rendering
adb shell settings put global force_gpu_rendering 0
```

## Compatibility

- **Tested On**: Lenovo Tab M10 (3rd Gen)
- **May Work On**: Other Lenovo tablets and Android devices
- **Android Version**: Android 11 and above recommended

## Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## License

This script is provided as-is for personal use. Modify and distribute freely.

## Author Notes

This script was created to address common performance and connectivity issues on the Lenovo Tab M10 (3rd Gen). The optimizations are based on safe, documented Android settings that don't require root access.

---

**Last Updated**: October 2025
