如下是参考一个动态库Android.mk的实现

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../../../includes/
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../xxx/
LOCAL_C_INCLUDES += abc.h

LOCAL_HEADER_LIBRARIES := libutils_headers
LOCAL_SRC_FILES        := abc.c
LOCAL_MODULE           := libAA_BB
LOCAL_SHARED_LIBRARIES := libcutils libmmcamera2_mct

LOCAL_MODULE_OWNER     := qti/mtk
LOCAL_PROPRIETARY_MODULE:= true


include $(BUILD_SHARED_LIBRARY)

最后生成的库文件名为 libAA_BB.so
