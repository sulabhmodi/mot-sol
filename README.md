# Motorola Solutions VDDK Init Image

## Overview

This image packages the VMware Virtual Disk Development Kit (VDDK) files in a container image format for use in VMware migration workflows.

It is intended to support virtualization migration scenarios where a VDDK init image is required to provide access to VMware virtual disk libraries during migration operations.

This image is based on Red Hat UBI minimal and follows the general VDDK image pattern documented for the Migration Toolkit for Virtualization (MTV).

## Purpose

The purpose of this image is to:

- Package the extracted `vmware-vix-disklib-distrib` contents into a portable container image
- Provide a standard internal image for migration tooling
- Simplify distribution through an internal enterprise registry
- Support consistent deployments across environments

## Important Notes

- VDDK is strongly recommended for VMware migration workflows because it improves performance and reduces migration risk.
- VMware VDDK archives contain symbolic links, so extraction and image build steps must be performed on a filesystem that preserves symlinks.
- This image should be stored only in a secure internal registry. Publishing VDDK artifacts to a public registry may violate VMware license terms.
- This image is intended for internal enterprise use by Motorola Solutions.

## Contents

The image contains:

- Red Hat UBI 8 minimal base image
- Extracted `vmware-vix-disklib-distrib` directory
- An entrypoint that copies the VDDK files into `/opt` when the container starts

## How It Works

At runtime, the container executes:

cp -r /vmware-vix-disklib-distrib /opt

This makes the VDDK libraries available under `/opt/vmware-vix-disklib-distrib` for the consuming workflow.

## Build Prerequisites

Before building the image:

1. Download the VMware VDDK archive from VMware.
2. Extract the archive on a filesystem that preserves symbolic links.
3. Confirm that the extracted directory is named:

vmware-vix-disklib-distrib

4. Place the extracted directory in the same location as the Dockerfile.

## Build the Image

Example:

podman build -t <your-registry>/motorolasolution/vddk-init:1.0.0 .

## Push the Image

Example:

podman push <your-registry>/motorolasolution/vddk-init:1.0.0

## Example Internal Tagging Convention

<registry>/motorolasolution/vddk-init:<version>

Example:

acrname.azurecr.io/motorolasolution/vddk-init:1.0.0

## Usage Notes

This image is typically referenced as an init image by migration tooling or platform configuration.

Because this image contains VMware VDDK content, access should be restricted to authorized internal users and approved environments only.

## Security and Compliance

- Store only in approved internal registries
- Do not publish externally
- Validate usage against VMware licensing requirements
- Track image version, source VDDK version, and build provenance in internal release records

## Ownership

Company: Motorola Solutions  
Image Name: motorolasolution/vddk-init  
Intended Use: Internal virtualization migration workflows  
Support Model: Internal platform / migration engineering team
