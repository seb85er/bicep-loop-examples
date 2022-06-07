$SubscriptionId = ""
$TenantId = ""
$TemplateFile = ".\modules\hubSpoke.bicep"
$ParameterFile = ".\parameters.json"
$Location = "uksouth"
$ResourceGroupName = "bicep-demo"

$CurrentContext = Get-Azcontext
if ($currentcontext.Subscription.Id -eq $SubscriptionId) {
    Write-Output "Correct subscription context $SubscriptionId"
} elseif ($null -ne $currentcontext.Subscription.Id) {
    Get-AzSubscription -SubscriptionId $SubscriptionId -TenantId $tenantId | Set-AzContext
} else {
    $CurrentContext = Login-AzAccount -TenantId $tenantId -Subscription $SubscriptionId -ErrorAction Stop
    if ($null -eq $CurrentContext) {
        Write-Error "Error selecting tenant and subscription"
    }
}

Write-Host "Deploying virtual networks" -fore Green
New-AzresourcegroupDeployment `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $ParameterFile `
    -ResourceGroupName $ResourceGroupName `
    -location $location