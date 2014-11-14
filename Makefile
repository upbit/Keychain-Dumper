ARCHS := armv7 armv7s arm64

include theos/makefiles/common.mk

TOOL_NAME = keychain_dumper
keychain_dumper_FRAMEWORKS = Security
keychain_dumper_LIBRARIES = sqlite3
keychain_dumper_FILES = main.m

include $(THEOS_MAKE_PATH)/tool.mk

ldid::
	export CODESIGN_ALLOCATE=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/codesign_allocate
	ldid -Sentitlements.xml obj/keychain_dumper
