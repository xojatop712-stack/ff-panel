ARCHS = arm64 arm64e
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FF_Gemini_Panel

# Fayl nomlari GitHub-dagi bilan bir xil bo'lishi shart
FF_Gemini_Panel_FILES = tweak.mm Menu.mm KittyMemory.cpp KittyUtils.cpp KittyScanner.cpp KittyArm64.cpp MemoryBackup.cpp MemoryPatch.cpp writeData.cpp SCLAlertView.m SCLAlertViewResponder.m SCLAlertViewStyleKit.m SCLButton.m SCLTextView.m SCLTimerDisplay.m SCLSwitchView.m UIImage+ImageEffects.m
FF_Gemini_Panel_LIBRARIES = z
FF_Gemini_Panel_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText

include $(THEOS_MAKE_PATH)/tweak.mk
