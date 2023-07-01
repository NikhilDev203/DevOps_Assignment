#web app 
output "windows_web_app_output" {
  description = " Web App output"
  value = { for k, v in azurerm_windows_web_app.windows_web_app : k => {
    id                                = v.id
    }
  }
}
