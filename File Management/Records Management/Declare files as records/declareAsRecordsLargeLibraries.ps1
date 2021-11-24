function Declare-Record
{
param (
        [Parameter(Mandatory=$true,Position=1)]
	[string]$Username,
	[Parameter(Mandatory=$true,Position=2)]
	[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
	$password,
        [Parameter(Mandatory=$true,Position=4)]
	[string]$ListTitle
		)


  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($url)
   [Microsoft.SharePOint.Client.ClientRuntimeContext] $rctx=[Microsoft.SharePoint.Client.ClientRuntimeContext]$ctx.Site.Context
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()
  $ll=$ctx.Web.Lists.GetByTitle($ListTitle)
  $ctx.Load($ll)
  $ctx.ExecuteQuery()
  $spqQuery = New-Object Microsoft.SharePoint.Client.CamlQuery

 # use this line if you want to limit the files to a specific folder 
 # $spqQuery.ViewXml ="<View Scope='RecursiveAll' /><Where><Eq><FieldRef Name='ServerRelativeUrl'/><Value Type='Text'>/Customers/blank</Value></Eq></Where>";

  $spqQuery.ViewXml ="<View Scope='RecursiveAll' />";
  $ViewThreshold=4000

  if($NumberOfItemsInTheList -gt $ViewThreshold)
  {
    [decimal]$NoOfRuns=($NumberOfItemsInTheList/$ViewThreshold)
    $NoOfRuns=[math]::Ceiling($NoOfRuns)

        for($WhichRun=0; $WhichRun -lt $NoOfRuns; $WhichRun++)
        {
            $startIndex=$WhichRun*$ViewThreshold
            $endIndex=$startIndex+$ViewThreshold      
            $spqQuery.ViewXml="<View Scope='RecursiveAll'><Query><Where><And>"+
		        "<Geq><FieldRef Name='ID'></FieldRef><Value Type='Number'>"+$startIndex+"</Value></Geq>"+
			    "<Lt><FieldRef Name='ID'></FieldRef><Value Type='Number'>"+$endIndex+"</Value></Lt>"+
		      "</And></Where></Query></View>"    
   
            Write-Host $spqQuery.ViewXml
            $partialItems=$ll.GetItems($spqQuery)
            $ctx.Load($partialItems)
            $ctx.ExecuteQuery()

            foreach($partialItem in $partialItems)
            {
                $itemki+=$partialItem
            }
        }
  }
  else
  {
         $itemki=$ll.GetItems($spqQuery)
         $ctx.Load($itemki)
         $ctx.ExecuteQuery()
  }

  $CounterFolder=0;
  $CounterAlreadyRecord=0;
  $CounterDeclared=0;
  $CounterUnexpectedError=0;

  foreach($item in $itemki)
  {
        Write-Host "Processing item no " $item.ID  -NoNewline
        $ctx.Load($item)
        $ctx.Load($item.File)
        $ctx.Load($item.Fieldvaluesastext)
        $ctx.ExecuteQuery()
        Write-Host $item.Fieldvaluesastext.FieldValues["FileDirRef"] "/" $item.Fieldvaluesastext.FieldValues["FileLeafRef"] 

        if($item.FileSystemObjectType -eq "Folder")
        {
            Write-Host "...This item cannot be declared a record because it is a Folder content type." -ForegroundColor Yellow
            $CounterFolder++
            continue;
        }
        
        <#
        [Boolean] $isRecord=[Microsoft.SharePoint.Client.RecordsRepository.Records]::IsRecord($ctx, $item)
        $isRecord
        if($isRecord)
        {
            Write-Host "...This item has already been declared a record." -ForegroundColor Yellow
            $CounterAlreadyRecord++
            continue;
        }
        #>

         [Microsoft.SharePoint.Client.RecordsRepository.Records]::DeclareItemAsRecord($ctx,$item)

         try
         {
            $ctx.ExecuteQuery()  
            Write-Host "...Item has been declared a record" -ForegroundColor Green
            $CounterDeclared++
         }
         catch
         {
            Write-Host "...Item could not be declared a record" -ForegroundColor Red
            $CounterUnexpectedError++
         }     
  }

  Write-Host 
  Write-Output "Execution finished." "$CounterFolder folders found and not processed." "$CounterAlreadyRecord documents were already records." "$CounterDeclared documents declared during this execution." "$CounterUnexpectedError unexpected errors occurred."

       $ctx.Dispose()
}






#Paths to SDK
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.Office.Client.Policy.dll"   
#Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 

 
#Enter the data
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString
$username="ana@etr56.onmicrosoft.com"
$Url="https://etr56.sharepoint.com/sites/testflow"
$ListTitle="Customers"



Declare-Record -Username $username -Url $Url -password $AdminPassword -ListTitle $ListTitle 
