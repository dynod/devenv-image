# Makefile for Docker images

# Setup roots
WORKSPACE_ROOT := $(CURDIR)/../..
PROJECT_ROOT := $(CURDIR)

# Main makefile suite - defs
include $(WORKSPACE_ROOT)/.workspace/main.mk

# Default target is to build Docker images
default: docker-images

# Main makefile suite - rules
include $(WORKSPACE_ROOT)/.workspace/rules.mk
