###
# Makefile
# Mateusz Szpakowski
###

ADLSDKDIR = ./dependencies/ADL_SDK_V10.2
CXX = g++
CXXFLAGS = -Wall -O3 -std=c++11 -Iincludes
LDFLAGS = -Wall -O3 -std=c++11
SRC_DIR = ./source
OBJ_DIR = ./obj
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES))
INCDIRS = -I$(ADLSDKDIR)/include
LIBDIRS =
LIBS = -ldl -lpci -lm -lOpenCL -pthread

.PHONY: all clean

all: amdcovc

amdcovc: $(OBJ_FILES)
	$(CXX) $(LDFLAGS) $(LIBDIRS) -o $@ $^ $(LIBS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f ./obj/*.o ./obj/*.d amdcovc

CXXFLAGS += -MMD
-include $(OBJ_FILES:.o=.d)

dockerbuild-ubuntu1604:
	make clean
	docker-compose -f support/docker/docker-compose-ubuntu1604.yml build
	docker-compose -f support/docker/docker-compose-ubuntu1604.yml run ubuntu1604 bash -c "make"

dockerbuild-fedora27:
	make clean
	docker-compose -f support/docker/docker-compose-fedora27.yml build
	docker-compose -f support/docker/docker-compose-fedora27.yml run fedora27 bash -c "make"
