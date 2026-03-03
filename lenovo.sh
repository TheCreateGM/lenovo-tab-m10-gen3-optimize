#!/bin/bash

# ==============================================================================
# Lenovo Tab M10 (3rd Gen) Performance & Network Optimizer (ADB Version)
#
# This script aims to improve network speed, hotspot stability, and overall
# device performance by applying a series of safe, non-root system-level
# tweaks via ADB.
#
# IMPORTANT: The device must have USB Debugging enabled and must authorize
# the ADB connection from this computer. No root access is required.
#
# DISCLAIMER: Use at your own risk. While these commands are generally safe,
# the author is not responsible for any damage to your device.
# ==============================================================================

# --- Function to print colored text ---
print_color() {
    case "$1" in
        "green") echo -e "\033[0;32m$2\033[0m" ;;
        "yellow") echo -e "\033[0;33m$2\033[0m" ;;
        "red") echo -e "\033[0;31m$2\033[0m" ;;
        *) echo "$2" ;;
    esac
}

# --- Prerequisite Checks ---
# Check if adb command exists
if ! command -v adb &> /dev/null; then
    print_color "red" "Error: 'adb' command not found."
    print_color "red" "Please install the Android SDK Platform-Tools and ensure 'adb' is in your PATH."
    exit 1
fi

# Check for connected device
print_color "yellow" "Checking for connected device..."
if ! adb get-state 1>/dev/null 2>/dev/null; then
    print_color "red" "Error: No device found. Please connect your device via USB and enable USB Debugging."
    exit 1
fi
print_color "green" "Device connected."

sleep 2
clear
print_color "green" "======================================================"
print_color "green" " Lenovo Tab M10 (3rd Gen) Performance Optimizer (ADB) "
print_color "green" "======================================================"
echo ""
print_color "yellow" "Starting optimization process. Please do not interrupt."
sleep 3

# --- Section 1: Network & Hotspot Enhancement ---
print_color "yellow" "\n[+] Optimizing Network Stack & Hotspot Speed..."
sleep 1

# Reset network connections by toggling Wi-Fi to clear caches.
echo "  -> Resetting network connections by toggling Wi-Fi..."
adb shell svc wifi disable >/dev/null 2>&1
sleep 3
adb shell svc wifi enable >/dev/null 2>&1
sleep 5 # Allow time for Wi-Fi to fully reconnect

# Use Cloudflare's Private DNS for faster and more secure lookups
echo "  -> Setting Private DNS to Cloudflare (1.1.1.1)..."
adb shell settings put global private_dns_mode hostname
adb shell settings put global private_dns_specifier 1dot1dot1dot1.cloudflare-dns.com

# Disable background Wi-Fi scanning to improve stability and battery life
echo "  -> Disabling background Wi-Fi scanning..."
adb shell settings put global wifi_scan_always_enabled 0

# Improve hotspot connection stability and speed
echo "  -> Optimizing Wi-Fi Hotspot performance..."
adb shell settings put global tether_offload_disabled 0
adb shell settings put global tether_dun_required 0
adb shell settings put global mobile_data_always_on 1

# Disable Wi-Fi power saving to reduce latency (Ping)
echo "  -> Disabling Wi-Fi power saving for maximum throughput..."
adb shell settings put global wifi_power_save 0
adb shell settings put global wifi_sleep_policy 2

print_color "green" "[OK] Network and hotspot optimized."
sleep 2

# --- Section 2: UI & Graphics Performance ---
print_color "yellow" "\n[+] Boosting UI & Graphics Performance..."
sleep 1

# Force GPU rendering for a smoother UI experience
echo "  -> Forcing GPU rendering for 2D operations..."
adb shell settings put global force_gpu_rendering 1

# Speed up animations for a snappier feel
echo "  -> Accelerating UI animation speeds..."
adb shell settings put global window_animation_scale 0.5
adb shell settings put global transition_animation_scale 0.5
adb shell settings put global animator_duration_scale 0.5

print_color "green" "[OK] UI and graphics performance enhanced."
sleep 2

# --- Section 3: System & Battery Optimization ---
print_color "yellow" "\n[+] Optimizing System & Background Processes..."
sleep 1

# Reducing the logging buffer size can save memory and slightly reduce CPU overhead.
echo "  -> Reducing logger buffer size to save resources..."
adb shell settings put global logger_size 256k

# Prevent system from throttling performance when acting as a hotspot
echo "  -> Disabling power-related background throttling..."
adb shell settings put global low_power_mode_trigger_level 0
adb shell settings put global adaptive_battery_management_enabled 0
adb shell settings put global app_standby_enabled 0

# Recalibrate battery stats to ensure more accurate readings.
echo "  -> Recalibrating battery statistics (unplug device after this)..."
adb shell dumpsys battery unplug
adb shell dumpsys battery reset

print_color "green" "[OK] System and background processes optimized."
sleep 2

# --- Finalization ---
echo ""
print_color "green" "======================================================"
print_color "green" "      Optimization process completed successfully!      "
print_color "green" "======================================================"
print_color "yellow" "\nA reboot is recommended to ensure all changes take full effect."
echo ""

exit 0
