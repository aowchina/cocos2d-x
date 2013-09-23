LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := cocosdenshion_static

LOCAL_MODULE_FILENAME := libcocosdenshion

LOCAL_SRC_FILES := SimpleAudioEngine.cpp \
                   jni/SimpleAudioEngineJni.cpp \
                   opensl/OpenSLEngine.cpp \
                   opensl/SimpleAudioEngineOpenSL.cpp

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../include

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../include \
                    $(LOCAL_PATH)/../../cocos2dx \
                    $(LOCAL_PATH)/../../cocos2dx/include \
                    $(LOCAL_PATH)/../../cocos2dx/kazmath/include \
                    $(LOCAL_PATH)/../../cocos2dx/platform/android

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
	LOCAL_ARM_NEON = true
endif
LOCAL_CFLAGS += -std=c99
LOCAL_CXXFLAGS := -fexceptions -fasm-blocks -fstrict-aliasing -g -fvisibility-inlines-hidden -std=gnu++11 -D__GXX_EXPERIMENTAL_CXX0X__

LOCAL_EXPORT_CXXFLAGS += -fexceptions -fasm-blocks -fstrict-aliasing -g -fvisibility-inlines-hidden -std=gnu++11 -D__GXX_EXPERIMENTAL_CXX0X__

include $(BUILD_STATIC_LIBRARY)
