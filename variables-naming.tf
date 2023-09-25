# Generic naming variables
variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Optional suffix for the generated name"
  type        = string
  default     = ""
}

variable "use_caf_naming" {
  description = "Use the Azure CAF naming provider to generate default resource name. `custom_aks_name` override this if set. Legacy default name is used if this is set to `false`."
  type        = bool
  default     = true
}

# Custom naming override
variable "aadpodidentity_custom_name" {
  description = "Custom name for aad pod identity MSI"
  type        = string
  default     = "aad-pod-identity"
}

variable "custom_aks_name" {
  description = "Custom AKS name"
  type        = string
  default     = ""
}

variable "aks_user_assigned_identity_custom_name" {
  description = "Custom name for the aks user assigned identity resource"
  type        = string
  default     = null
}

variable "appgw_user_assigned_identity_custom_name" {
  description = "Custom name for the application gateway user assigned identity resource"
  type        = string
  default     = null
}
