#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/freertos-quadx.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/freertos-quadx.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=BSW/hardware_config.c BSW/utils.c BSW/main.c BSW/software_config.c BSW/os_quad_hook.c BSW/os_quad_task.c BSW/os_quad_timer.c LLD/i2c_driver.c LLD/ic_driver.c LLD/pwm_driver.c LLD/sensors.c LLD/uart_driver.c LLD/timer.c OS/Config/ConfigPerformance.c OS/Kernel/croutine.c OS/Kernel/list.c OS/Kernel/queue.c OS/Kernel/tasks.c OS/Kernel/timers.c OS/portable/MemMang/heap_1.c OS/portable/MPLAB/PIC32MX/port.c OS/portable/MPLAB/PIC32MX/port_asm.S

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/BSW/hardware_config.o ${OBJECTDIR}/BSW/utils.o ${OBJECTDIR}/BSW/main.o ${OBJECTDIR}/BSW/software_config.o ${OBJECTDIR}/BSW/os_quad_hook.o ${OBJECTDIR}/BSW/os_quad_task.o ${OBJECTDIR}/BSW/os_quad_timer.o ${OBJECTDIR}/LLD/i2c_driver.o ${OBJECTDIR}/LLD/ic_driver.o ${OBJECTDIR}/LLD/pwm_driver.o ${OBJECTDIR}/LLD/sensors.o ${OBJECTDIR}/LLD/uart_driver.o ${OBJECTDIR}/LLD/timer.o ${OBJECTDIR}/OS/Config/ConfigPerformance.o ${OBJECTDIR}/OS/Kernel/croutine.o ${OBJECTDIR}/OS/Kernel/list.o ${OBJECTDIR}/OS/Kernel/queue.o ${OBJECTDIR}/OS/Kernel/tasks.o ${OBJECTDIR}/OS/Kernel/timers.o ${OBJECTDIR}/OS/portable/MemMang/heap_1.o ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o
POSSIBLE_DEPFILES=${OBJECTDIR}/BSW/hardware_config.o.d ${OBJECTDIR}/BSW/utils.o.d ${OBJECTDIR}/BSW/main.o.d ${OBJECTDIR}/BSW/software_config.o.d ${OBJECTDIR}/BSW/os_quad_hook.o.d ${OBJECTDIR}/BSW/os_quad_task.o.d ${OBJECTDIR}/BSW/os_quad_timer.o.d ${OBJECTDIR}/LLD/i2c_driver.o.d ${OBJECTDIR}/LLD/ic_driver.o.d ${OBJECTDIR}/LLD/pwm_driver.o.d ${OBJECTDIR}/LLD/sensors.o.d ${OBJECTDIR}/LLD/uart_driver.o.d ${OBJECTDIR}/LLD/timer.o.d ${OBJECTDIR}/OS/Config/ConfigPerformance.o.d ${OBJECTDIR}/OS/Kernel/croutine.o.d ${OBJECTDIR}/OS/Kernel/list.o.d ${OBJECTDIR}/OS/Kernel/queue.o.d ${OBJECTDIR}/OS/Kernel/tasks.o.d ${OBJECTDIR}/OS/Kernel/timers.o.d ${OBJECTDIR}/OS/portable/MemMang/heap_1.o.d ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o.d ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/BSW/hardware_config.o ${OBJECTDIR}/BSW/utils.o ${OBJECTDIR}/BSW/main.o ${OBJECTDIR}/BSW/software_config.o ${OBJECTDIR}/BSW/os_quad_hook.o ${OBJECTDIR}/BSW/os_quad_task.o ${OBJECTDIR}/BSW/os_quad_timer.o ${OBJECTDIR}/LLD/i2c_driver.o ${OBJECTDIR}/LLD/ic_driver.o ${OBJECTDIR}/LLD/pwm_driver.o ${OBJECTDIR}/LLD/sensors.o ${OBJECTDIR}/LLD/uart_driver.o ${OBJECTDIR}/LLD/timer.o ${OBJECTDIR}/OS/Config/ConfigPerformance.o ${OBJECTDIR}/OS/Kernel/croutine.o ${OBJECTDIR}/OS/Kernel/list.o ${OBJECTDIR}/OS/Kernel/queue.o ${OBJECTDIR}/OS/Kernel/tasks.o ${OBJECTDIR}/OS/Kernel/timers.o ${OBJECTDIR}/OS/portable/MemMang/heap_1.o ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o

# Source Files
SOURCEFILES=BSW/hardware_config.c BSW/utils.c BSW/main.c BSW/software_config.c BSW/os_quad_hook.c BSW/os_quad_task.c BSW/os_quad_timer.c LLD/i2c_driver.c LLD/ic_driver.c LLD/pwm_driver.c LLD/sensors.c LLD/uart_driver.c LLD/timer.c OS/Config/ConfigPerformance.c OS/Kernel/croutine.c OS/Kernel/list.c OS/Kernel/queue.c OS/Kernel/tasks.c OS/Kernel/timers.c OS/portable/MemMang/heap_1.c OS/portable/MPLAB/PIC32MX/port.c OS/portable/MPLAB/PIC32MX/port_asm.S


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/freertos-quadx.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX340F512H
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o: OS/portable/MPLAB/PIC32MX/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX 
	@${RM} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.d 
	@${RM} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o 
	@${RM} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.ok ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.d" "${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -DMPLAB_PIC32MX_PORT -D_SUPPRESS_PLIB_WARNING -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.d"  -o ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o OS/portable/MPLAB/PIC32MX/port_asm.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -I"OS/include" -I"OS/portable" --no-warn
	
else
${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o: OS/portable/MPLAB/PIC32MX/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX 
	@${RM} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.d 
	@${RM} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o 
	@${RM} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.ok ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.d" "${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -DMPLAB_PIC32MX_PORT -D_SUPPRESS_PLIB_WARNING -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.d"  -o ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o OS/portable/MPLAB/PIC32MX/port_asm.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port_asm.o.asm.d",--gdwarf-2 -I"OS/include" -I"OS/portable" --no-warn
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/BSW/hardware_config.o: BSW/hardware_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/hardware_config.o.d 
	@${RM} ${OBJECTDIR}/BSW/hardware_config.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/hardware_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/hardware_config.o.d" -o ${OBJECTDIR}/BSW/hardware_config.o BSW/hardware_config.c   
	
${OBJECTDIR}/BSW/utils.o: BSW/utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/utils.o.d 
	@${RM} ${OBJECTDIR}/BSW/utils.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/utils.o.d" -o ${OBJECTDIR}/BSW/utils.o BSW/utils.c   
	
${OBJECTDIR}/BSW/main.o: BSW/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/main.o.d 
	@${RM} ${OBJECTDIR}/BSW/main.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/main.o.d" -o ${OBJECTDIR}/BSW/main.o BSW/main.c   
	
${OBJECTDIR}/BSW/software_config.o: BSW/software_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/software_config.o.d 
	@${RM} ${OBJECTDIR}/BSW/software_config.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/software_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/software_config.o.d" -o ${OBJECTDIR}/BSW/software_config.o BSW/software_config.c   
	
${OBJECTDIR}/BSW/os_quad_hook.o: BSW/os_quad_hook.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/os_quad_hook.o.d 
	@${RM} ${OBJECTDIR}/BSW/os_quad_hook.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/os_quad_hook.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/os_quad_hook.o.d" -o ${OBJECTDIR}/BSW/os_quad_hook.o BSW/os_quad_hook.c   
	
${OBJECTDIR}/BSW/os_quad_task.o: BSW/os_quad_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/os_quad_task.o.d 
	@${RM} ${OBJECTDIR}/BSW/os_quad_task.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/os_quad_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/os_quad_task.o.d" -o ${OBJECTDIR}/BSW/os_quad_task.o BSW/os_quad_task.c   
	
${OBJECTDIR}/BSW/os_quad_timer.o: BSW/os_quad_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/os_quad_timer.o.d 
	@${RM} ${OBJECTDIR}/BSW/os_quad_timer.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/os_quad_timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/os_quad_timer.o.d" -o ${OBJECTDIR}/BSW/os_quad_timer.o BSW/os_quad_timer.c   
	
${OBJECTDIR}/LLD/i2c_driver.o: LLD/i2c_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/i2c_driver.o.d 
	@${RM} ${OBJECTDIR}/LLD/i2c_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/i2c_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/i2c_driver.o.d" -o ${OBJECTDIR}/LLD/i2c_driver.o LLD/i2c_driver.c   
	
${OBJECTDIR}/LLD/ic_driver.o: LLD/ic_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/ic_driver.o.d 
	@${RM} ${OBJECTDIR}/LLD/ic_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/ic_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/ic_driver.o.d" -o ${OBJECTDIR}/LLD/ic_driver.o LLD/ic_driver.c   
	
${OBJECTDIR}/LLD/pwm_driver.o: LLD/pwm_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/pwm_driver.o.d 
	@${RM} ${OBJECTDIR}/LLD/pwm_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/pwm_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/pwm_driver.o.d" -o ${OBJECTDIR}/LLD/pwm_driver.o LLD/pwm_driver.c   
	
${OBJECTDIR}/LLD/sensors.o: LLD/sensors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/sensors.o.d 
	@${RM} ${OBJECTDIR}/LLD/sensors.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/sensors.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/sensors.o.d" -o ${OBJECTDIR}/LLD/sensors.o LLD/sensors.c   
	
${OBJECTDIR}/LLD/uart_driver.o: LLD/uart_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/uart_driver.o.d 
	@${RM} ${OBJECTDIR}/LLD/uart_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/uart_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/uart_driver.o.d" -o ${OBJECTDIR}/LLD/uart_driver.o LLD/uart_driver.c   
	
${OBJECTDIR}/LLD/timer.o: LLD/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/timer.o.d 
	@${RM} ${OBJECTDIR}/LLD/timer.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/timer.o.d" -o ${OBJECTDIR}/LLD/timer.o LLD/timer.c   
	
${OBJECTDIR}/OS/Config/ConfigPerformance.o: OS/Config/ConfigPerformance.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Config 
	@${RM} ${OBJECTDIR}/OS/Config/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/OS/Config/ConfigPerformance.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Config/ConfigPerformance.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Config/ConfigPerformance.o.d" -o ${OBJECTDIR}/OS/Config/ConfigPerformance.o OS/Config/ConfigPerformance.c   
	
${OBJECTDIR}/OS/Kernel/croutine.o: OS/Kernel/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Kernel 
	@${RM} ${OBJECTDIR}/OS/Kernel/croutine.o.d 
	@${RM} ${OBJECTDIR}/OS/Kernel/croutine.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Kernel/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Kernel/croutine.o.d" -o ${OBJECTDIR}/OS/Kernel/croutine.o OS/Kernel/croutine.c   
	
${OBJECTDIR}/OS/Kernel/list.o: OS/Kernel/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Kernel 
	@${RM} ${OBJECTDIR}/OS/Kernel/list.o.d 
	@${RM} ${OBJECTDIR}/OS/Kernel/list.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Kernel/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Kernel/list.o.d" -o ${OBJECTDIR}/OS/Kernel/list.o OS/Kernel/list.c   
	
${OBJECTDIR}/OS/Kernel/queue.o: OS/Kernel/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Kernel 
	@${RM} ${OBJECTDIR}/OS/Kernel/queue.o.d 
	@${RM} ${OBJECTDIR}/OS/Kernel/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Kernel/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Kernel/queue.o.d" -o ${OBJECTDIR}/OS/Kernel/queue.o OS/Kernel/queue.c   
	
${OBJECTDIR}/OS/Kernel/tasks.o: OS/Kernel/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Kernel 
	@${RM} ${OBJECTDIR}/OS/Kernel/tasks.o.d 
	@${RM} ${OBJECTDIR}/OS/Kernel/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Kernel/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Kernel/tasks.o.d" -o ${OBJECTDIR}/OS/Kernel/tasks.o OS/Kernel/tasks.c   
	
${OBJECTDIR}/OS/Kernel/timers.o: OS/Kernel/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Kernel 
	@${RM} ${OBJECTDIR}/OS/Kernel/timers.o.d 
	@${RM} ${OBJECTDIR}/OS/Kernel/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Kernel/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Kernel/timers.o.d" -o ${OBJECTDIR}/OS/Kernel/timers.o OS/Kernel/timers.c   
	
${OBJECTDIR}/OS/portable/MemMang/heap_1.o: OS/portable/MemMang/heap_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/portable/MemMang 
	@${RM} ${OBJECTDIR}/OS/portable/MemMang/heap_1.o.d 
	@${RM} ${OBJECTDIR}/OS/portable/MemMang/heap_1.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/portable/MemMang/heap_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/portable/MemMang/heap_1.o.d" -o ${OBJECTDIR}/OS/portable/MemMang/heap_1.o OS/portable/MemMang/heap_1.c   
	
${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o: OS/portable/MPLAB/PIC32MX/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX 
	@${RM} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o.d 
	@${RM} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o.d" -o ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o OS/portable/MPLAB/PIC32MX/port.c   
	
else
${OBJECTDIR}/BSW/hardware_config.o: BSW/hardware_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/hardware_config.o.d 
	@${RM} ${OBJECTDIR}/BSW/hardware_config.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/hardware_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/hardware_config.o.d" -o ${OBJECTDIR}/BSW/hardware_config.o BSW/hardware_config.c   
	
${OBJECTDIR}/BSW/utils.o: BSW/utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/utils.o.d 
	@${RM} ${OBJECTDIR}/BSW/utils.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/utils.o.d" -o ${OBJECTDIR}/BSW/utils.o BSW/utils.c   
	
${OBJECTDIR}/BSW/main.o: BSW/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/main.o.d 
	@${RM} ${OBJECTDIR}/BSW/main.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/main.o.d" -o ${OBJECTDIR}/BSW/main.o BSW/main.c   
	
${OBJECTDIR}/BSW/software_config.o: BSW/software_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/software_config.o.d 
	@${RM} ${OBJECTDIR}/BSW/software_config.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/software_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/software_config.o.d" -o ${OBJECTDIR}/BSW/software_config.o BSW/software_config.c   
	
${OBJECTDIR}/BSW/os_quad_hook.o: BSW/os_quad_hook.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/os_quad_hook.o.d 
	@${RM} ${OBJECTDIR}/BSW/os_quad_hook.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/os_quad_hook.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/os_quad_hook.o.d" -o ${OBJECTDIR}/BSW/os_quad_hook.o BSW/os_quad_hook.c   
	
${OBJECTDIR}/BSW/os_quad_task.o: BSW/os_quad_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/os_quad_task.o.d 
	@${RM} ${OBJECTDIR}/BSW/os_quad_task.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/os_quad_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/os_quad_task.o.d" -o ${OBJECTDIR}/BSW/os_quad_task.o BSW/os_quad_task.c   
	
${OBJECTDIR}/BSW/os_quad_timer.o: BSW/os_quad_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/BSW 
	@${RM} ${OBJECTDIR}/BSW/os_quad_timer.o.d 
	@${RM} ${OBJECTDIR}/BSW/os_quad_timer.o 
	@${FIXDEPS} "${OBJECTDIR}/BSW/os_quad_timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/BSW/os_quad_timer.o.d" -o ${OBJECTDIR}/BSW/os_quad_timer.o BSW/os_quad_timer.c   
	
${OBJECTDIR}/LLD/i2c_driver.o: LLD/i2c_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/i2c_driver.o.d 
	@${RM} ${OBJECTDIR}/LLD/i2c_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/i2c_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/i2c_driver.o.d" -o ${OBJECTDIR}/LLD/i2c_driver.o LLD/i2c_driver.c   
	
${OBJECTDIR}/LLD/ic_driver.o: LLD/ic_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/ic_driver.o.d 
	@${RM} ${OBJECTDIR}/LLD/ic_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/ic_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/ic_driver.o.d" -o ${OBJECTDIR}/LLD/ic_driver.o LLD/ic_driver.c   
	
${OBJECTDIR}/LLD/pwm_driver.o: LLD/pwm_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/pwm_driver.o.d 
	@${RM} ${OBJECTDIR}/LLD/pwm_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/pwm_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/pwm_driver.o.d" -o ${OBJECTDIR}/LLD/pwm_driver.o LLD/pwm_driver.c   
	
${OBJECTDIR}/LLD/sensors.o: LLD/sensors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/sensors.o.d 
	@${RM} ${OBJECTDIR}/LLD/sensors.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/sensors.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/sensors.o.d" -o ${OBJECTDIR}/LLD/sensors.o LLD/sensors.c   
	
${OBJECTDIR}/LLD/uart_driver.o: LLD/uart_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/uart_driver.o.d 
	@${RM} ${OBJECTDIR}/LLD/uart_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/uart_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/uart_driver.o.d" -o ${OBJECTDIR}/LLD/uart_driver.o LLD/uart_driver.c   
	
${OBJECTDIR}/LLD/timer.o: LLD/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/LLD 
	@${RM} ${OBJECTDIR}/LLD/timer.o.d 
	@${RM} ${OBJECTDIR}/LLD/timer.o 
	@${FIXDEPS} "${OBJECTDIR}/LLD/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/LLD/timer.o.d" -o ${OBJECTDIR}/LLD/timer.o LLD/timer.c   
	
${OBJECTDIR}/OS/Config/ConfigPerformance.o: OS/Config/ConfigPerformance.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Config 
	@${RM} ${OBJECTDIR}/OS/Config/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/OS/Config/ConfigPerformance.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Config/ConfigPerformance.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Config/ConfigPerformance.o.d" -o ${OBJECTDIR}/OS/Config/ConfigPerformance.o OS/Config/ConfigPerformance.c   
	
${OBJECTDIR}/OS/Kernel/croutine.o: OS/Kernel/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Kernel 
	@${RM} ${OBJECTDIR}/OS/Kernel/croutine.o.d 
	@${RM} ${OBJECTDIR}/OS/Kernel/croutine.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Kernel/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Kernel/croutine.o.d" -o ${OBJECTDIR}/OS/Kernel/croutine.o OS/Kernel/croutine.c   
	
${OBJECTDIR}/OS/Kernel/list.o: OS/Kernel/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Kernel 
	@${RM} ${OBJECTDIR}/OS/Kernel/list.o.d 
	@${RM} ${OBJECTDIR}/OS/Kernel/list.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Kernel/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Kernel/list.o.d" -o ${OBJECTDIR}/OS/Kernel/list.o OS/Kernel/list.c   
	
${OBJECTDIR}/OS/Kernel/queue.o: OS/Kernel/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Kernel 
	@${RM} ${OBJECTDIR}/OS/Kernel/queue.o.d 
	@${RM} ${OBJECTDIR}/OS/Kernel/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Kernel/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Kernel/queue.o.d" -o ${OBJECTDIR}/OS/Kernel/queue.o OS/Kernel/queue.c   
	
${OBJECTDIR}/OS/Kernel/tasks.o: OS/Kernel/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Kernel 
	@${RM} ${OBJECTDIR}/OS/Kernel/tasks.o.d 
	@${RM} ${OBJECTDIR}/OS/Kernel/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Kernel/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Kernel/tasks.o.d" -o ${OBJECTDIR}/OS/Kernel/tasks.o OS/Kernel/tasks.c   
	
${OBJECTDIR}/OS/Kernel/timers.o: OS/Kernel/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/Kernel 
	@${RM} ${OBJECTDIR}/OS/Kernel/timers.o.d 
	@${RM} ${OBJECTDIR}/OS/Kernel/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/Kernel/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/Kernel/timers.o.d" -o ${OBJECTDIR}/OS/Kernel/timers.o OS/Kernel/timers.c   
	
${OBJECTDIR}/OS/portable/MemMang/heap_1.o: OS/portable/MemMang/heap_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/portable/MemMang 
	@${RM} ${OBJECTDIR}/OS/portable/MemMang/heap_1.o.d 
	@${RM} ${OBJECTDIR}/OS/portable/MemMang/heap_1.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/portable/MemMang/heap_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/portable/MemMang/heap_1.o.d" -o ${OBJECTDIR}/OS/portable/MemMang/heap_1.o OS/portable/MemMang/heap_1.c   
	
${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o: OS/portable/MPLAB/PIC32MX/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX 
	@${RM} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o.d 
	@${RM} ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o 
	@${FIXDEPS} "${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DMPLAB_PIC32MX_PORT -I"OS/include" -I"OS/portable" -MMD -MF "${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o.d" -o ${OBJECTDIR}/OS/portable/MPLAB/PIC32MX/port.o OS/portable/MPLAB/PIC32MX/port.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/freertos-quadx.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/freertos-quadx.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}           -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/freertos-quadx.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/freertos-quadx.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/freertos-quadx.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
