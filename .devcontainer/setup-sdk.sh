#!/bin/bash
set -e

echo "======================================================================"
echo " [INFRASTRUCTURE] PROVISIONING COMPILER ENVIRONMENTS INSIDE NODE      "
echo "======================================================================"

# Establish persistent operational home targets
export ANDROID_HOME=$HOME/android-sdk
mkdir -p "$ANDROID_HOME/cmdline-tools"
cd "$ANDROID_HOME/cmdline-tools"

# Download official Android Command-Line tools package asset binaries
echo "[+] Fetching Android command-line compiler tools repository..."
wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdline.zip
unzip -q cmdline.zip
mv cmdline-tools latest
rm cmdline.zip
cd -

# Enforce permanent environment system variable paths across shell instances
echo "[+] Binding cryptographic path arrays to system profiles..."
ENV_PATHS="
export ANDROID_HOME=\$HOME/android-sdk
export PATH=\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin:\$ANDROID_HOME/platform-tools:\$ANDROID_HOME/build-tools/34.0.0
"
echo "$ENV_PATHS" >> "$HOME/.bashrc"
echo "$ENV_PATHS" >> "$HOME/.zshrc"

# Export immediately into active execution thread context
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# Accept Google legal developer license terms non-interactively
echo "[+] Signing remote vendor software licensing matrices..."
yes | sdkmanager --licenses > /dev/null

# Install target SDK components requested by the VERVE master template
echo "[+] Syncing required API Platform level structures (Target 34)..."
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0" > /dev/null

# Pre-allocate proper execution access modifiers for the local project build wrapper
if [ -f "gradlew" ]; then
    chmod +x gradlew
    echo "[+] System workspace wrapper execution attributes assigned cleanly."
fi

echo "======================================================================"
echo " [PROVISION COMPLETE] CONTAINER DEVELOPMENT NODE READY FOR COMPILATION"
echo "======================================================================"
