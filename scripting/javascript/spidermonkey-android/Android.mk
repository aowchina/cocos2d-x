LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE    := spidermonkey_static
LOCAL_MODULE_FILENAME := js_static
LOCAL_SRC_FILES := ./lib/$(TARGET_ARCH_ABI)/libjs_static.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_CPPFLAGS := -D__STDC_LIMIT_MACROS=1
LOCAL_EXPORT_CPPFLAGS := -D__STDC_LIMIT_MACROS=1

LOCAL_ARM_NEON := true
LOCAL_CXXFLAGS += -fexceptions -fasm-blocks -fstrict-aliasing -g -fvisibility-inlines-hidden -std=gnu++11 -D__GXX_EXPERIMENTAL_CXX0X__

include $(PREBUILT_STATIC_LIBRARY)
