# NOTE: this makefile assumes that DEMOKIT is an environment
# variable.

PYTHON=python2.7
SOURCES=$(wildcard *.repy)

.PHONY: clean mkdirs run templates files

ifndef DEMOKIT
DEMOKIT=`pwd`/demokit
endif

all: gen/out.repy

gen/out.repy: templates files mkdirs $(SOURCES)
	@echo "Generating output file .."
	$(PYTHON) $(DEMOKIT)/repypp.py main.repy gen/out.repy

mkdirs:
	mkdir -p gen

clean:
	rm -rf ./gen

templates: mkdirs
	cp ./templates/*.html ./gen/

files: mkdirs
	cp neighborlist.txt ./gen/

run: gen/out.repy templates files mkdirs
	@echo 'Starting on 127.0.0.1:63100'
	@cd ./gen && $(PYTHON) $(DEMOKIT)/repy.py $(DEMOKIT)/restrictions.allowallports out.repy 63100 127.0.0.1

run-multiple: gen/out.repy templates files
	@cd ./gen && (for i in $$(seq 63100 63103); do \
			 $(PYTHON) $(DEMOKIT)/repy.py $(DEMOKIT)/restrictions.default out.repy $$i 127.0.0.1 & \
		done)
