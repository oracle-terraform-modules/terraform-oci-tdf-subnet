# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

module "oci_subnets" {
  source = "../../"

  default_compartment_id = var.default_compartment_id
  # uncomment if used with remote_state 
  # vcn_id = data.terraform_remote_state.network.outputs.vcn.id
  vcn_id   = oci_core_vcn.this.id
  vcn_cidr = oci_core_vcn.this.cidr_block

  subnets = {
    test1 = {
      compartment_id    = null
      defined_tags      = null
      freeform_tags     = null
      dynamic_cidr      = true
      cidr              = null
      cidr_len          = 30
      cidr_num          = 0
      enable_dns        = true
      dns_label         = "test1"
      private           = true
      ad                = null
      dhcp_options_id   = null
      route_table_id    = null
      security_list_ids = null
    },
    test2 = {
      compartment_id    = null
      defined_tags      = null
      freeform_tags     = null
      dynamic_cidr      = true
      cidr              = "192.168.0.128/25"
      cidr_len          = null
      cidr_num          = null
      enable_dns        = true
      dns_label         = "test2"
      private           = true
      ad                = 0
      dhcp_options_id   = null
      route_table_id    = null
      security_list_ids = null
    },
    test3 = {
      compartment_id    = null
      defined_tags      = null
      freeform_tags     = null
      dynamic_cidr      = true
      cidr              = "192.168.0.128/25"
      cidr_len          = null
      cidr_num          = 4
      enable_dns        = false
      dns_label         = null
      private           = true
      ad                = null
      dhcp_options_id   = null
      route_table_id    = null
      security_list_ids = null
    },
    test4 = {
      compartment_id    = null
      defined_tags      = null
      freeform_tags     = null
      dynamic_cidr      = false
      cidr              = "192.168.0.12/30"
      cidr_len          = null
      cidr_num          = 1
      enable_dns        = false
      dns_label         = "test4"
      private           = true
      ad                = null
      dhcp_options_id   = null
      route_table_id    = null
      security_list_ids = null
    },
    test5 = {
      compartment_id    = null
      defined_tags      = null
      freeform_tags     = null
      dynamic_cidr      = false
      cidr              = "192.168.0.16/30"
      cidr_len          = null
      cidr_num          = 1
      enable_dns        = true
      dns_label         = null
      private           = false
      ad                = null
      dhcp_options_id   = null
      route_table_id    = null
      security_list_ids = null
    }
  }
}

resource "oci_core_vcn" "this" {
  dns_label      = "temp"
  cidr_block     = "192.168.0.0/16"
  compartment_id = var.default_compartment_id
  display_name   = "temp"
}
