LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE    := cocos_lua_static

LOCAL_MODULE_FILENAME := liblua

LOCAL_SRC_FILES := ../cocos2dx_support/CCLuaBridge.cpp \
          ../cocos2dx_support/CCLuaEngine.cpp \
          ../cocos2dx_support/CCLuaStack.cpp \
          ../cocos2dx_support/CCLuaValue.cpp \
          ../cocos2dx_support/Cocos2dxLuaLoader.cpp \
          ../cocos2dx_support/LuaCocos2d.cpp \
          ../tolua/tolua_event.c \
          ../tolua/tolua_is.c \
          ../tolua/tolua_map.c \
          ../tolua/tolua_push.c \
          ../tolua/tolua_to.c \
          ../cocos2dx_support/tolua_fix.c
          
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../luajit/include \
                           $(LOCAL_PATH)/../tolua \
                           $(LOCAL_PATH)/../cocos2dx_support 
          
          
LOCAL_C_INCLUDES := $(LOCAL_PATH)/ \
                    $(LOCAL_PATH)/../luajit/include \
                    $(LOCAL_PATH)/../tolua \
                    $(LOCAL_PATH)/../../../cocos2dx \
                    $(LOCAL_PATH)/../../../cocos2dx/include \
                    $(LOCAL_PATH)/../../../cocos2dx/platform \
                    $(LOCAL_PATH)/../../../cocos2dx/platform/android \
                    $(LOCAL_PATH)/../../../cocos2dx/kazmath/include \
                    $(LOCAL_PATH)/../../../CocosDenshion/include \
                    $(LOCAL_PATH)/../../../extensions

LOCAL_CFLAGS += -std=c99
LOCAL_CXXFLAGS += -fexceptions -fasm-blocks -fstrict-aliasing -g -fvisibility-inlines-hidden -std=gnu++11 -D__GXX_EXPERIMENTAL_CXX0X__
LOCAL_ARM_NEON := true
LOCAL_WHOLE_STATIC_LIBRARIES := luajit_static

LOCAL_EXPORT_CFLAGS += -fexceptions -fasm-blocks -fstrict-aliasing -g -fvisibility-inlines-hidden -std=gnu++11 -D__GXX_EXPERIMENTAL_CXX0X__

include $(BUILD_STATIC_LIBRARY)

$(call import-module,scripting/lua/luajit)
