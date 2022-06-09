provider "aws" {

    access_key = "AKIA2XMGPCB2NLDTDPW6"
    secret_key = "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"
    region = "ap-south-1"
    
}



module "network_module" {

    source = "./network_module"
  
}


module "loadbalancer_module" {
  
  source = "./loadbalancer_module"
  publicsg_id="${module.network_module.publicsg_id}"
}


module "autoscaling_module" {
    source = "./autoscaling_module"
    privatesg_id="${module.network_module.privatesg_id}"
    tg_arn = "${module.loadbalancer_module.tg_arn }"
    
}