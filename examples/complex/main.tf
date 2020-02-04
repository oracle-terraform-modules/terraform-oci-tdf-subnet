# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

module "oci_subnets" {
  source           = "../../"
  default_compartment_id  = var.default_compartment_id
  
  # When used in conjunction with remote_state
  # vcn_id = data.terraform_remote_state.network.outputs.vcn.id
  vcn_id                = oci_core_vcn.this.id
  vcn_cidr              = oci_core_vcn.this.cidr_block
  subnets               = var.subnets
}

resource "oci_core_vcn" "this" {
  dns_label             = "temp"
  cidr_block            = "192.168.0.0/16"
  compartment_id        = var.default_compartment_id
  display_name          = "temp"
}

