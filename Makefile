# Makefile for Docker images

# Setup roots
WORKSPACE_ROOT := $(CURDIR)/../../..
PROJECT_ROOT := $(CURDIR)

# Docker image name
DOCKER_IMAGE_NAME := dynod/devenv

# Main makefile suite - defs
include $(WORKSPACE_ROOT)/.workspace/main.mk

# Default target is to build Docker image
default: docker-image

# Main makefile suite - rules
include $(WORKSPACE_ROOT)/.workspace/rules.mk
