output "service_principal_name" {
  description = "The object id of service principal. Can be used to assign roles to user."
  value       = azuread_service_principal.main.display_name
}

output "service_principal_object_id" {
  description = "The object id of service principal. Can be used to assign roles to user."
  value       = azuread_service_principal.main.object_id
}

output "service_principal_tenant_id" {
  value = azuread_service_principal.main.application_tenant_id
}

output "service_principal_application_id" {
  description = "The object id of service principal. Can be used to assign roles to user."
  value       = azuread_service_principal.main.application_id
}

output "client_id" {
  description = "The application id of AzureAD application created."
  value       = azuread_application.main.application_id
}

output "client_secret" {
  description = "Password for service principal."
  value       = azuread_service_principal_password.main.value
 
}