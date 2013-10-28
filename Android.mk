LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

thermald_src_path := ./src
thermald_src_files := $(thermald_src_path)/android_main.cpp \
		$(thermald_src_path)/thd_engine.cpp \
		$(thermald_src_path)/thd_cdev.cpp \
		$(thermald_src_path)/thd_engine_therm_sys_fs.cpp \
		$(thermald_src_path)/thd_engine_dts.cpp \
		$(thermald_src_path)/thd_cdev_pstates.cpp \
		$(thermald_src_path)/thd_cdev_msr_pstates.cpp \
		$(thermald_src_path)/thd_cdev_turbo_states.cpp \
		$(thermald_src_path)/thd_cdev_therm_sys_fs.cpp \
		$(thermald_src_path)/thd_cdev_tstates.cpp \
		$(thermald_src_path)/thd_cdev_intel_pstate_driver.cpp \
		$(thermald_src_path)/thd_cdev_rapl.cpp \
		$(thermald_src_path)/thd_msr.cpp \
		$(thermald_src_path)/thd_sys_fs.cpp \
		$(thermald_src_path)/thd_trip_point.cpp \
		$(thermald_src_path)/thd_zone.cpp \
		$(thermald_src_path)/thd_zone_dts.cpp \
		$(thermald_src_path)/thd_zone_dts_sensor.cpp \
		$(thermald_src_path)/thd_zone_therm_sys_fs.cpp \
		$(thermald_src_path)/thd_preference.cpp \
		$(thermald_src_path)/thd_model.cpp \
		$(thermald_src_path)/thd_parse.cpp \
		$(thermald_src_path)/thd_topology.cpp \
		$(thermald_src_path)/thd_kobj_uevent.cpp \
		$(thermald_src_path)/thd_rapl_interface.cpp \
		$(thermald_src_path)/thd_cdev_msr_rapl.cpp \
		$(thermald_src_path)/thd_cdev_order_parser.cpp \
		$(thermald_src_path)/thd_cdev_intel_pstate_turbo.cpp

include external/stlport/libstlport.mk

LOCAL_C_INCLUDES += $(LOCAL_PATH) $(thermald_src_path) \
			$(call include-path-for, dbus) \
			external/icu4c/common \
			external/libxml2/include

LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -fpermissive -DTDRUNDIR='"/data/thermald_run"' -DTDCONFDIR='"/data/thermald_conf"'
LOCAL_STATIC_LIBRARIES := libxml2
LOCAL_SHARED_LIBRARIES := liblog libcutils libdl libstlport libicuuc libicui18n libdbus
LOCAL_PRELINK_MODULE := false
LOCAL_SRC_FILES := $(thermald_src_files)
LOCAL_MODULE := thermald
include $(BUILD_EXECUTABLE)