如下是参考一个动态库Android.mk的实现

LOCAL_PATH := $(call my-dir)
#CLEAR_VARS变量指向一个特殊的GNU makefile，清除许多LOCAL_XXX变量，例如LOCAL_MODULE、LOCAL_SRC_FILES和LOCAL_STATIC_LIBRARIES。
#但是不会清除LOCAL_PATH。
include $(CLEAR_VARS)  

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../../../includes/
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../xxx/
LOCAL_C_INCLUDES += abc.h

LOCAL_HEADER_LIBRARIES := libutils_headers
#必须包含要编译模块中的C/C++源文件列表。
LOCAL_SRC_FILES        := abc.c

#存储要编译的模块名称，每个模块名称必须唯一，且不含任何空格。编译系统在生成最终共享文件时，会自动添加前缀和后缀。
#如果模块名称开头已经是lib，则不再附加lib的前缀。
LOCAL_MODULE           := libAA_BB
LOCAL_SHARED_LIBRARIES := libcutils libmmcamera2_mct

LOCAL_MODULE_OWNER     := qti/mtk
LOCAL_PROPRIETARY_MODULE:= true

#BUILD_SHARED_LIBRARY指向一个GNU Makefile脚本，该脚本收集自最近include以来在LOCAL_XX变量中定义的所有信息。
#此脚本确定要编译的内容以及编译方式。
include $(BUILD_SHARED_LIBRARY)

最后生成的库文件名为 libAA_BB.so


PREBUILT_STATIC_LIBRARY/PREBUILT_SHARED_LIBRARY 
  指向用于指定预编译共享库的编译脚本。与BUILD_SHARED_LIBRARY和BUILD_STATIC_LIBRARY不同，
这里的LOCAL_SRC_FILES值不能是源文件，必须是指向预编译共享库的一个路径。

LOCAL_PREBUILTS
  引用另一个模块中的预编译库。

目标信息变量
TARGET_ARCH 
  指定CPU系列，此变量是arm,arm64,x86或x86_64之一。

LOCAL_C_INCLUDES
  必须在变量LOCAL_CFLAGS和LOCAL_CPPFLAGS之前。

LOCAL_LDLIBS
  列出在编译共享库或可执行文件时使用的额外连接器标记。-l前缀传递特定系统库的名称。
  
all-subdir-makefiles
  返回位于当前my-dir路径所有子目录中的Android.mk文件列表。为编译系统提供深度嵌套的源目录层次结构。
