
# module "helm-deploy" {
#   source                 = "fuchicorp/chart/helm"
#   deployment_name        = "hello-world"
#   deployment_environment = "prod"
#   deployment_endpoint    = "hello.ahmetbekan.com"
#   deployment_path        = "hello-world"
# }




module "academy-deploy" {
  source  = "tuyalou/chart/helm" #"fuchicorp/chart/helm"
  deployment_name        = "hello-world"
  deployment_environment = "${var.deployment_environment}"
  deployment_endpoint    = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
  deployment_path        = "hello-world"
  template_custom_vars  = {     
    deployment_image     = "${var.deployment_image}"
  }
}
output "application_endpoint" {
    value = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
}