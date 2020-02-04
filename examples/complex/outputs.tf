# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "subnets" {
  description = "The Subnet(s) that have been created as a part of this module."
  value       = module.oci_subnets.subnets
}
