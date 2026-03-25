export THEOS_DEVICE_IP = 127.0.0.1
export THEOS_DEVICE_PORT = 2222

ARCHS = arm64
TARGET = iphone:clang:latest:14.5

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FF_Gemini_Panel

# Bu yerda hamma fayllarni asosiy joydan qidirishni ko'rsatdik
FF_Gemini_Panel_FILES = Tweak.mm $(wildcard *.m) $(wildcard *.cpp) SCLAlertView/SCLAlertView.m

FF_Gemini_Panel_CFLAGS = -fobjc-arc -I./
FF_Gemini_Panel_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText

include $(THEOS_MAKE_PATH)/tweak.mk
