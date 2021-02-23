TARGET := iphone:clang:latest:10.0
INSTALL_TARGET_PROCESSES = SpringBoard

DEBUG = 0

FINALPACKAGE = 1


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = UnlockForMusic

UnlockForMusic_FILES = Tweak.xm
UnlockForMusic_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
