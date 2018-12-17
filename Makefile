# tool marcros
CC := clang++
CCFLAG := -std=c++17
DBGFLAG := -g
CCOBJFLAG := $(CCFLAG) -c
TARFLAG := --target=x86_64-w64-mingw

# path marcros
BIN_PATH := bin
OBJ_PATH := obj
DBG_PATH := debug
SRC_PATH := src
UTL_PATH := $(SRC_PATH)/utils

# compile marcros
TARGET_NAME := main
ifeq ($(OS),Windows_NT)
	TARGET_NAME := $(addsuffix .exe,$(TARGET_NAME))
endif
TARGET := $(BIN_PATH)/$(TARGET_NAME)
TARGET_DEBUG := $(DBG_PATH)/$(TARGET_NAME)

# src files & obj files
MAIN_SRC := $(foreach x, $(SRC_PATH), $(wildcard $(addprefix $(x)/*,.c*)))
MAIN_OBJ := $(addprefix $(OBJ_PATH)/, $(addsuffix .o, $(notdir $(basename $(MAIN_SRC)))))
DBG_MAIN_OBJ := $(addprefix $(DBG_PATH)/, $(addsuffix .o, $(notdir $(basename $(MAIN_SRC)))))

UTL_SRC := $(foreach x, $(UTL_PATH), $(wildcard $(addprefix $(x)/*,.c*)))
UTL_OBJ := $(addprefix $(OBJ_PATH)/, $(addsuffix .o, $(notdir $(basename $(UTL_SRC)))))
DBG_UTL_OBJ := $(addprefix $(DBG_PATH)/, $(addsuffix .o, $(notdir $(basename $(UTL_SRC)))))

OBJ := $(UTL_OBJ) $(MAIN_OBJ)
DBG_OBJ :=  $(DBG_UTL_OBJ) $(DBG_MAIN_OBJ)

# clean files list
DISTCLEAN_LIST := $(OBJ) \
				  $(DBG_OBJ)
CLEAN_LIST := $(TARGET) \
			  $(TARGET_DEBUG) \
			  $(DISTCLEAN_LIST)

# default rule
default: all

# openGL setting
OPENGL_PATH := OpenGL
OPENGL_INCLUD := $(OPENGL_PATH)/include
OPENGL_LIBS := $(OPENGL_PATH)/libs
LINKLIBS := -lassimp.dll -lstbimage -lglfw3dll -lglfw3 -lglad

# non-phony targets
$(TARGET): $(OBJ)
	$(CC) $(TARFLAG) $(CCFLAG) -o $@ $(OBJ) -I$(OPENGL_INCLUD) -L$(OPENGL_LIBS) $(LINKLIBS)

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c*
	$(CC) $(TARFLAG) $(CCOBJFLAG) -o $@ $< -I$(OPENGL_INCLUD)

$(OBJ_PATH)/%.o: $(UTL_PATH)/%.c*
	$(CC) $(TARFLAG) $(CCOBJFLAG) -o $@ $< -I$(OPENGL_INCLUD)

$(TARGET_DEBUG): $(DBG_OBJ)
	$(CC) $(TARFLAG) $(CCFLAG) $(DBGFLAG) $(DBG_OBJ) -o $@ -I$(OPENGL_INCLUD) -L$(OPENGL_LIBS) $(LINKLIBS)

$(DBG_PATH)/%.o: $(SRC_PATH)/%.c*
	$(CC) $(TARFLAG) $(CCOBJFLAG) $(DBGFLAG) -o $@ $< -I$(OPENGL_INCLUD)

$(DBG_PATH)/%.o: $(UTL_PATH)/%.c*
	$(CC) $(TARFLAG) $(CCOBJFLAG) $(DBGFLAG) -o $@ $< -I$(OPENGL_INCLUD)

# phony rules
.PHONY: all
all: $(TARGET)

.PHONY: debug
debug: $(TARGET_DEBUG)

.PHONY: clean
clean:
	@echo CLEAN $(CLEAN_LIST)
	@rm -f $(CLEAN_LIST)

.PHONY: distclean
distclean:
	@echo CLEAN $(CLEAN_LIST)
	@rm -f $(DISTCLEAN_LIST)