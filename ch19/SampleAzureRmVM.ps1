Param(
    # Variables for common values
    [string]$ResourceGroup = "packtpub-rg",
    [string]$StorageAcctName = "packtstorage",
    [string]$Location = "East US",
    [string]$VNetName = "packtpub-vnet",
    [string]$NicName = "packtpub-vm-nic",
    [string]$DiskName = "packtUbuntu",
    [string]$VmName = "packtpub-ubuntu"
)

#Check for open session
Connect-AzureRmAccount

# Create user object
$Cred = Get-Credential -Message "Enter username and password of administrator crendentials"

# Create a resource group
New-AzureRmResourceGroup -Name $ResourceGroup -Location $Location

#Create a storage account
New-AzureRmStorageAccount -Name $StorageAcctName -ResourceGroupName $ResourceGroup -Type Standard_LRS -Location $Location

# Create a subnet configuration
$SubnetCfg = New-AzureRmVirtualNetworkSubnetConfig -Name mySubnet -AddressPrefix 10.0.1.0/24

# Create a virtual network
$VNet = New-AzureRmVirtualNetwork -Name $VNetName -ResourceGroupName $ResourceGroup -Location $Location -AddressPrefix 10.0.0.0/16 -Subnet $SubnetCfg

# Create a public IP address and specify a DNS name
$IP = New-AzureRmPublicIpAddress -Name $NicName -ResourceGroupName $ResourceGroup -Location $Location -AllocationMethod Dynamic

# Create a virtual network card and associate with public IP address and NSG
$Nic = New-AzureRmNetworkInterface -Name $NicName -ResourceGroupName $ResourceGroup -Location $Location -SubnetId $VNet.Subnets[0].Id -PublicIpAddressId $IP.Id

#Create a blob storage
$StorageAccount = Get-AzureRmStorageAccount -ResourceGroupName $ResourceGroup -Name $StorageAcctName
$OSDiskUri = $StorageAccount.PrimaryEndpoints.Blob.ToString()+'vhds/'+$DiskName+".vhd"

# Create a virtual machine configuration
$Vm = New-AzureRmVMConfig -VMName $VmName -VMSize "Basic_A1"
$Vm = Set-AzureRmVMOperatingSystem -VM $Vm -Linux -ComputerName $VmName -Credential $Cred
$Vm = Set-AzureRmVMSourceImage -VM $Vm -PublisherName 'Canonical' -Offer 'UbuntuServer' -Skus '18.04-LTS' -Version 'latest'
$Vm = Add-AzureRmVMNetworkInterface -VM $Vm -id $Nic.Id
$Vm = Set-AzureRmVMOSDisk -VM $Vm -Name $DiskName -VhdUri $OSDiskUri -CreateOption FromImage

# Create a virtual machine
New-AzureRmVM -ResourceGroupName $ResourceGroup -Location $Location -VM $Vm