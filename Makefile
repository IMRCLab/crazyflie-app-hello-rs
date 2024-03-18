
# Name of the crate
CRATE_NAME=cfapprs


CRAZYFLIE_BASE := $(PWD)/crazyflie-firmware

OOT_CONFIG := $(PWD)/app-config

# This is a hack that creates many warnings, since I can't find a way to tell kbuild to link
# with an external *.a file
# EXTRA_CFLAGS += $(PWD)/build/lib$(CRATE_NAME).a

include $(CRAZYFLIE_BASE)/tools/make/oot.mk

lib$(CRATE_NAME).a: FORCE
	cargo build --release --target thumbv7em-none-eabihf
	cp target/thumbv7em-none-eabihf/release/lib$(CRATE_NAME).a build/lib$(CRATE_NAME).a

FORCE: 
