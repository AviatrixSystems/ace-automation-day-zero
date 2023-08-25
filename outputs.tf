output "ace_automation" {
  value = {
    controller_ip          = module.ace_automation.controller_ip
    copilot_ip             = module.ace_automation.copilot_ip
    bu1_bastion_public_ip  = module.ace_automation.bu1_bastion_public_ip,
    bu1_bastion_private_ip = module.ace_automation.bu1_bastion_private_ip,
    bu2_app_private_ip     = module.ace_automation.bu2_app_private_ip,
  }
}
