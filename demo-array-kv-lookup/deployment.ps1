$SubscriptionId = ""
$TenantId = ""
$TemplateFile = ".\demo-array-kv-lookup.bicep"
$Location = "uksouth"

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

Write-Host "Deploying Resource Groups" -fore Green
New-AzsubscriptionDeployment `
    -TemplateFile $TemplateFile `
    -location $location -Verbose
