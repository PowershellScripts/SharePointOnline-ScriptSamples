function Remove-Workflows{
    param(
        [Parameter(Mandatory = $true, Position = 1)]
        [string]$Username,
        [Parameter(Mandatory = $true, Position = 2)]
        $AdminPassword,
        [Parameter(Mandatory = $true, Position = 3)]
        [string]$Url
    )
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($Url)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
    $web = $context.Web
    $context.Load($Web)
    $context.ExecuteQuery()   

    $context.Load($web.WorkflowAssociations)
    $context.ExecuteQuery()

    Write-Host $web.WorkflowAssociations.count

    while ($web.WorkflowAssociations.count -gt 0) {
        $SiteWorkflowAssociations = $web.WorkflowAssociations
        $context.Load($SiteWorkflowAssociations)
        $context.ExecuteQuery()
    
        $SiteWorkflowAssociations | ForEach-Object {
            Write-Output $_
            $_.DeleteObject()
            $context.ExecuteQuery()
        }
    }
    
}    
    
    # Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the site collection and the path where the report should be saved.
$Username = "2190@tenant.onmicrosoft.com"
$AdminPassword = Read-Host -Prompt "Password" -AsSecureString
$Url = "https://tenant.sharepoint.com/sites/YOURSITE"


Remove-Workflows -Username $Username -AdminPassword $AdminPassword -Url $Url 
