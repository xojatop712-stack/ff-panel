ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

# Ogohlantirishlarni xato deb hisoblamaslik uchun
IGNORE_WARNINGS = 1

# Windows/PC-da ishlayotganingiz uchun buni 0 qiling
MOBILE_THEOS = 0

include $(THEOS)/makefiles/common.mk

# Panelingizning nomi
TWEAK_NAME = FF_Gemini_Panel

# Kerakli tizim kutubxonalari
FF_Gemini_Panel_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText

# Loyihangizdagi barcha fayllarni birga yig'ish
# Diqqat: tweak.mm faylingiz nomi aynan shunday bo'lishi kerak
FF_Gemini_Panel_FILES = Tweak.mm Menu.mm $(wildcard SCLAlertView/*.m) $(wildcard KittyMemory/*.cpp)

# Kompilyatsiya sozlamalari
FF_Gemini_Panel_CFLAGS = -fobjc-arc
FF_Gemini_Panel_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG

# Substrate kutubxonasini ulash
FF_Gemini_Panel_LIBRARIES += substrate

include $(THEOS_MAKE_PATH)/tweak.mk