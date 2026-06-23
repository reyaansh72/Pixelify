# Pixelify

A Magisk Addon To Turn Any AOSP-Based Android ROM Into A Pixel!

---

## ⚠️ For Normal Users

**If you are not a developer or modifier, please do NOT download the source code from this branch.**

To use Pixelify on your Android device:

1. Navigate to the **Releases** section on the right sidebar of this GitHub page
2. Download the latest ready-to-flash **`.zip` module**
3. Flash the module using Magisk Manager or similar Magisk front-end
4. Reboot your device and enjoy the Pixel experience!

> **Note:** The source code in this repository is intended for developers and modifiers only. Regular users should always use the pre-built releases.

---

## 👨‍💻 For Developers / Modifiers

The core source code structure is archived inside `system.zip` for easier repository management and version control.

### Getting Started

#### Step 1: Clone the Repository

```bash
git clone https://github.com/reyaansh72/Pixelify.git
cd Pixelify
```

#### Step 2: Extract system.zip

Extract the `system.zip` archive into a dedicated folder named `system`:

```bash
unzip system.zip -d system
```

Your directory structure should now look like:

```
Pixelify/
├── system/
│   ├── etc/
│   ├── media/
│   ├── priv-app/
│   └── ...
├── add.sh
├── repack.sh
├── system.zip
└── README.md
```

### Step 3: Modify Assets

You can modify or add assets in two ways:

#### Option A: Manual Modification

Navigate to the appropriate subdirectories under `system/` and make your changes:

- **`system/etc/`** — System configuration files
- **`system/media/`** — Media assets (sounds, wallpapers, ringtones, etc.)
- **`system/priv-app/`** — Privileged system applications

#### Option B: Automated Modification (Using add.sh)

Use the included `add.sh` script to automate the process of adding or updating assets:

```bash
bash add.sh
```

This script simplifies adding files to the appropriate subdirectories within the `system/` folder.

### Step 4: Repack Your Changes

Once you've finished modifying the assets, follow these steps to build the final module:

#### 4a: Remove the Old Archive

```bash
rm system.zip
```

#### 4b: Rezip the Modified System Directory

```bash
cd system
zip -r ../system.zip .
cd ..
```

#### 4c: Run the Repack Script

```bash
bash repack.sh
```

This will clean the repository and build the final flashable Magisk module.

---

## 📋 Directory Structure Reference

```
system/
├── etc/                    # System configuration files
├── media/                  # Media assets
│   ├── fonts/
│   ├── ringtones/
│   ├── wallpapers/
│   └── ...
└── priv-app/               # Privileged system apps
    ├── PixelLauncher/
    ├── PixelSystemUIDialog/
    └── ...
```

---

## 📝 Important Notes

- **Always test your changes** before flashing on your main device. Use a test device or create a system backup first.
- **Keep `system` Folder updated** with your latest changes before running `repack.sh`.
- **Ensure proper file permissions** when adding new files to the system directory.
- **Follow Magisk module structure** guidelines to ensure compatibility.

---

## 🤝 Contributing

If you'd like to contribute improvements or fixes:

1. Fork the repository
2. Create a new branch for your changes
3. Make your modifications following the steps above
4. Test thoroughly
5. Submit a pull request with a clear description of your changes

---

## 📄 License

Please refer to the LICENSE file in this repository for licensing information.

---

**Enjoy customizing your Android ROM with Pixelify!** 🎨
