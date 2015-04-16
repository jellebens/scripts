function New-TableStorage{
    param($Name, $SubscriptionName)
    
    $location = "West Europe";

    Write-Host "Start create new storage $name"

    $publishsettings = "$PsScriptRoot\publishsettings\*.publishsettings";

    if(!(Test-Path -Path $publishsettings)){
        New-Item "$PsScriptRoot\publishsettings" -ItemType directory;
        Write-Warning 'Did not find any publish settings make sure to dowload the publish settings file to "$PsScriptRoot\publishsettings\*.publishsettings"'
        Get-AzurePublishSettingsFile
        break;
    }

    $publishSettings = Import-AzurePublishSettingsFile –PublishSettingsFile $publishsettings;

    Select-AzureSubscription $SubscriptionName;

    

    if((Test-AzureName -Storage $Name)){
        Write-Warning "Storage Account allrady exists skipping creation";
    }

    New-AzureStorageAccount -StorageAccountName $name -Location $location;

    
}

New-TableStorage -Name "edttest" -SubscriptionName "Visual Studio Premium with MSDN"; 