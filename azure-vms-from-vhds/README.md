# Azure Arm Templates IaaSv2 - Deploy N number of Linux VM's from custom VHD image
<html>

This Azure Arm Template deploys n number of Ubuntu VM's and assumes following is in place

Onetime steps:

a)	Create a  resource group, Storage account , vnet, and subnet created from UI or CLI

b)	Create a Linux VM from Gallery ( I tried with Ubuntu 14) and customize it as you need, install everything that is required.

c)	Follow this steps to capture this as image:  

https://github.com/Azure/azure-content/blob/master/articles/virtual-machines/virtual-machines-linux-capture-image-resource-manager.md

d)	 Once Image is captured it will be in your storage account  in path as below  (Get this path from UI of Storage Blob  and leave image as is copy the URL) , you will see something like below

https://storageaccountname.blob.core.windows.net/system/Microsoft.Compute/Images/vhds/linux-image-name.vhd

* Note its Critical : Image has to be in /system/Microsoft.Compute/Images/vhds/ this path and it same storage account where you create copies of new vms.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsrakesh28%2Fdemo-working%2Fsingle-vnet-vms-arm-templates%2Fvms-from-vhs%2Fazuredeploy-fromvhds-vms-pip.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>


Now Use this template to deploy as many VM’s as you need :

It Assumesabove Onetime steps are done

Update Variables to reflect your name of  Storage account , vnet, and subnet etc..
Provide your SSH-Public-Key 
Provide you SSH Path as : /home/<username>/.ssh/authorized_keys	  This has to be same otherwise it will complain

Try to SSH with your Private Key to Public IP it should work.


![ScreenShot](https://github.com/srakesh28/azure-iaasv2-arm/blob/master/IaaSv2-vnet-vms-pip.jpg)
</html>
