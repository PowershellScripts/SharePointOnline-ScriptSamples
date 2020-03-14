function Get-DeletedItems
{
param (
  [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		$AdminPassword,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$Url
)


#Create the context and test the connection
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)

    try
    {
        $ctx.ExecuteQuery()
    } 
    catch [Net.WebException] 
    {            
        Write-Host $Url " failed to connect to the site" $_.Exception.Message.ToString() -ForegroundColor Red
    }

  

# Retrieve recycle bin items from a single subsite 
  $ctx.Load($ctx.Site)  
  $rb=$ctx.Web.RecycleBin
  $ctx.Load($rb)
    
    try
    {
        $ctx.ExecuteQuery()
        Write-Host $ctx.Site.Url " Items in the recycle bin: " $rb.Count.ToString()
    } 
    catch [Net.WebException] 
    {          
        Write-Host $ctx.Site.Url " failed" $_.Exception.Message.ToString() -ForegroundColor Red

    }

$myarray=@()

#Add the items to an array and display them for a user
    for($i=0;$i -lt $rb.Count ;$i++)
    {
        
            $ctx.Load($rb[$i].Author)
            $ctx.Load($rb[$i].DeletedBy)
            $ctx.ExecuteQuery()
            $obj = $rb[$i]
            $obj | Add-Member NoteProperty AuthorLoginName($rb[$i].Author.LoginName)
            $obj | Add-Member NoteProperty DeletedByLoginName($rb[$i].DeletedBy.LoginName)
            $myarray+=$obj
            Write-Host ($obj.DirName+"/"+$obj.LeafName)

    }

# Asks permission to restore
Write-Host "`n`nProceed with restoring all these items?" -ForegroundColor Green 
$proceed=Read-Host "y/n"

    if($proceed -eq "y")
    {
        for($i=0;$i -lt $myarray.Count ; $i++)
        {
            #Restores a single item
            $myarray[$i].Restore()
        
            try
            {
                $ctx.ExecuteQuery()
                Write-Host $myarray[$i].LeafName " restored" -ForegroundColor Green
            }
            catch [Net.WebException]
            {
                Write-Host $myarray[$i].LeafName " failed" $_.Message.ToString() -ForegroundColor Red
            }
        }
    }
    elseif($proceed -eq "n")
    {
        Write-Host "No items will be restored"
    }
    else
    {
        Write-Host "Command not recognized"
    }







}




# Paths to SDK. Please verify location on your computer.
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

# Insert the credentials and the name of the admin site
$Username="arleta@tenant.onmicrosoft.com"
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString
$Site="https://tenant.sharepoint.com/sub1"



 Get-DeletedItems -Username $Username -AdminPassword $AdminPassword -Url $Site 






