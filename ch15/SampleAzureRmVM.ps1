Param(
# Variables for common values
[string]$resourceGroup = "packtpub-rg",
[string]$storageAcctName ="packtstorage",
[string]$location = "East US",
[string]$vnetName="packtpub-vnet",
[string]$NicName="packtpub-vm-nic",
[string]$diskname="packtUbuntu",
[string]$vmName = "packtpub-ubuntu"
)
         

#Check for open session
Connect-AzureRmAccount

# Create user object
$cred = Get-Credential -Message "Enter username and password of administrator crendentials"

# Create a resource group
New-AzureRmResourceGroup -Name $resourceGroup -Location $location

#Create a storage account
New-AzureRmStorageAccount -Name $storageAcctName -ResourceGroupName $resourceGroup -Type Standard_LRS -Location $location                                                                                    


# Create a subnet configuration
$subnetCfg = New-AzureRmVirtualNetworkSubnetConfig -Name mySubnet -AddressPrefix 10.0.1.0/24

# Create a virtual network
$vnet=New-AzureRmVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroup -Location $location -AddressPrefix 10.0.0.0/16 -Subnet $subnetCfg

# Create a public IP address and specify a DNS name


# Create a virtual network card and associate with public IP address and NSG
$nic=New-AzureRmNetworkInterface -Name $nicname -ResourceGroupName $resourceGroup -Location $location -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $IP.Id                                                


#Create a blob storage
$storageAccount=Get-AzureRmStorageAccount -ResourceGroupName $resourceGroup -Name $storageAcctName                
$osdiskuri=$storageAccount.PrimaryEndpoints.Blob.ToString()+'vhds/'+$diskname+".vhd" 

# Create a virtual machine configuration
$vm =New-AzureRmVMConfig -VMName $vmname -VMSize "Basic_A1"
$vm=Set-AzureRmVMOperatingSystem -VM $vm -Linux -ComputerName $vmname -Credential $cred
$vm=Set-AzureRmVMSourceImage -VM $vm -PublisherName 'Canonical' -Offer 'UbuntuServer' -Skus '18.04-LTS' -Version 'latest'
$vm=Add-AzureRmVMNetworkInterface -VM $vm -id $nic.Id
$vm=Set-AzureRmVMOSDisk -VM $vm -Name $diskname -VhdUri $osdiskuri -CreateOption fromImage 

       

# Create a virtual machine
New-AzureRmVM -ResourceGroupName $resourceGroup -Location $location -VM $vm  