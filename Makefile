PWD=$(shell pwd)
AAP_JUCE_DIR=$(PWD)/external/aap-juce

APP_NAME=Wavetable

APP_BUILD_DIR=$(PWD)
APP_SRC_DIR=$(PWD)/external/Wavetable
JUCE_DIR=$(APP_SRC_DIR)/modules/juce

# For metadata updates, relative to build-desktop
APP_SHARED_CODE_LIBS="$(APP_NAME)_artefacts/lib$(APP_NAME)_SharedCode.a"

# Populate aap-juce-support.patch with upstream changes required for AAP,
# then uncomment the following two lines to have `make` apply it automatically.
#PATCH_FILE=$(PWD)/aap-juce-support.patch
#PATCH_DEPTH=1

# JUCE patches if any
JUCE_PATCHES= \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/export-jni-symbols.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/disable-detach-current-thread.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/support-plugin-ui.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/embedded-peer-window-guard.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/juce-component-peer-view-touch.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/popup-menu-android.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/standalone-aap-factory-weak-fallback.patch

JUCE_PATCH_DEPTH=1

include $(AAP_JUCE_DIR)/Makefile.cmake-common
