# Base Terraform setup
terraform {
  required_providers {
    launchdarkly = {
      source  = "launchdarkly/launchdarkly"
      version = "~> 2.18.4"
    }
  }
  required_version = "~> 1.9.0"
}

# Configure the LaunchDarkly provider
provider "launchdarkly" {
  access_token = var.launchdarkly_access_token
}

variable "launchdarkly_access_token" {
  type        = string
  sensitive   = true
  description = "LaunchDarkly access token"
}

# Custom role policies definitions

resource "launchdarkly_custom_role" "engineering_data" {
  key         = "engineering-data"
  name        = "Engineering & Data"
  description = "Role for the engineering and data teams"
  base_permissions  = "reader"

  # Top-level resources
  policy_statements {
    resources = [
      "application/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "code-reference-repository/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "integration/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "service-token/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "member/*:token/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "template/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "webhook/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  # Project-scoped resources
  policy_statements {
    resources = [
      "proj/alan-applications"
    ]
    actions = [
      "updateDefaultClientSideAvailability", 
      "updateIncludeInSnippetByDefault",
      "updateProjectFlagDefaults",
      "updateTags",
      "updateDefaultReleasePipeline"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:context-kind/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:release-pipeline/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:layer/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:destination/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:flag/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  # Prevent members from applying or bypassing approvals
  policy_statements {
    resources = [
      "proj/alan-applications:env/*:flag/*",
    ]
    actions = [
      "applyApprovalRequest",
      "bypassRequiredApproval",
      "reviewApprovalRequest"
    ]
    effect = "deny"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:segment/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  # Experimentation-related resources (still project-scoped)
  policy_statements {
    resources = [
      "proj/alan-applications:env/*:experiment/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:holdout/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

   policy_statements {
    resources = [
      "proj/alan-applications:layer/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

   policy_statements {
    resources = [
      "proj/alan-applications:metric/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:metric-group/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }
}

resource "launchdarkly_custom_role" "product_management" {
  key         = "product-management"
  name        = "Product Management"
  description = "Role for the product management team"
  base_permissions  = "reader"

  # Top-level resources
  policy_statements {
    resources = [
      "application/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "code-reference-repository/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "integration/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "service-token/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "member/*:token/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "template/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "webhook/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  # Project-scoped resources
  policy_statements {
    resources = [
      "proj/alan-applications"
    ]
    actions = [
      "updateDefaultClientSideAvailability", 
      "updateIncludeInSnippetByDefault",
      "updateProjectFlagDefaults",
      "updateTags",
      "updateDefaultReleasePipeline"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:context-kind/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:release-pipeline/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:layer/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:destination/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:flag/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  # Prevent members from creating feature flags
  policy_statements {
    resources = [
      "proj/alan-applications:env/*:flag/*",
    ]
    actions = [
      "createFlag"
    ]
    effect = "deny"
  }

  # Prevent members from applying or bypassing approvals
  policy_statements {
    resources = [
      "proj/alan-applications:env/*:flag/*",
    ]
    actions = [
      "applyApprovalRequest",
      "bypassRequiredApproval",
      "reviewApprovalRequest"
    ]
    effect = "deny"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:segment/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  # Experimentation-related resources (still project-scoped)
  policy_statements {
    resources = [
      "proj/alan-applications:env/*:experiment/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:holdout/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

   policy_statements {
    resources = [
      "proj/alan-applications:layer/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

   policy_statements {
    resources = [
      "proj/alan-applications:metric/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:metric-group/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }
}

resource "launchdarkly_custom_role" "security" {
  key         = "security"
  name        = "Security"
  description = "Role for the security team"
  base_permissions  = "reader"

  # Top-level resources
  policy_statements {
    resources = [
      "application/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "code-reference-repository/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "integration/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "service-token/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "member/*:token/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "template/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "webhook/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  # Project-scoped resources
  policy_statements {
    resources = [
      "proj/alan-applications"
    ]
    actions = [
      "updateDefaultClientSideAvailability", 
      "updateIncludeInSnippetByDefault",
      "updateProjectFlagDefaults",
      "updateTags",
      "updateDefaultReleasePipeline"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:context-kind/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:release-pipeline/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:layer/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:destination/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:flag/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  # Prevent members from bypassing approvals
  policy_statements {
    resources = [
      "proj/alan-applications:env/*:flag/*",
    ]
    actions = [
      "bypassRequiredApproval",
    ]
    effect = "deny"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:segment/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  # Experimentation-related resources (still project-scoped)
  policy_statements {
    resources = [
      "proj/alan-applications:env/*:experiment/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:env/*:holdout/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

   policy_statements {
    resources = [
      "proj/alan-applications:layer/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

   policy_statements {
    resources = [
      "proj/alan-applications:metric/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/alan-applications:metric-group/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }
}

resource "launchdarkly_custom_role" "infrastructure" {
  key         = "infrastructure"
  name        = "Infrastructure"
  description = "Role for the infrastructure team"
  base_permissions  = "reader"

  policy_statements {
    resources = [
      "acct"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "application/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "code-reference-repository/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "domain-verification/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "integration/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "member/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "member/*:token/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "pending-request/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*:context-kind/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*:env/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*:env/*:destination/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*:env/*:flag/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*:env/*:segment/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*:env/*:experiment/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*:env/*:holdout/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*:layer/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*:metric/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*:metric-group/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/*:release-pipeline/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "member/*:token/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "relay-proxy-config/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "role/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "service-token/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "team/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "template/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "webhook/*",
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }
}

# LD Team definitions
variable "group_names" {
  type    = list(string)
  default = ["engineering-data", "product-management", "security", "infrastructure"] 
}

resource "launchdarkly_team" "group_teams" {
  for_each = toset(var.group_names)

  key         = "${each.key}"
  name        = "${each.key} team"
  description = "Team for ${each.key} members"

  custom_role_keys = [
    "${each.key}"
  ]

  # ignore changes to team membership to avoid overwriting IDP assignments
  lifecycle {
    ignore_changes = [member_ids]
  }
}
