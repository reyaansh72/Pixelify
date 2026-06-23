#!/usr/bin/env bash

# Define base system directory
BASE_DIR="./system"

echo "========================================="
echo "   ReyaanshOS APK Installer [FINAL]      "
echo "========================================="

# 1. Select APK
echo "Select how to provide the APK:"
echo "1) Open File Manager"
echo "2) Enter URL"
read -p "Choice [1 or 2]: " method_choice

target_apk="./temp_package.apk"

if [[ "$method_choice" == "1" ]]; then
    selected_file=$(zenity --file-selection --title="Select an APK file" --file-filter="*.apk")
    [[ -z "$selected_file" ]] && { echo "[!] No file selected."; exit 1; }
    cp "$selected_file" "$target_apk"
else
    read -p "Enter URL: " url_input
    echo "[+] Downloading..."
    wget -q --show-progress -O "$target_apk" "$url_input"
fi

# 2. Extract Package Name (Requirement: aapt must be in your PATH)
if command -v aapt &> /dev/null; then
    pkg_name=$(aapt dump badging "$target_apk" | grep "package: name=" | cut -d"'" -f2)
    echo "[*] Detected Package: $pkg_name"
else
    echo "[!] aapt not found. Please enter package name manually (e.g., com.google.android.apps.nexuslauncher):"
    read -p "Package Name: " pkg_name
fi

# 3. Select Installation Path
echo "Where to install?"
echo "1) /system/priv-app"
echo "2) /system/app"
read -p "Select [1 or 2]: " choice

case $choice in
    1) INSTALL_DIR="${BASE_DIR}/priv-app" ;;
    2) INSTALL_DIR="${BASE_DIR}/app" ;;
    *) INSTALL_DIR="${BASE_DIR}/app" ;;
esac

# 4. Finalize - Organize and Rename
# We use the package name for the folder and the APK to ensure compatibility
final_path="${INSTALL_DIR}/${pkg_name}"
mkdir -p "$final_path"

echo "[+] Organizing..."
mv "$target_apk" "${final_path}/${pkg_name}.apk"

echo "========================================="
echo " Success!"
echo " Folder: ${final_path}"
echo " APK: ${pkg_name}.apk"
echo "========================================="
