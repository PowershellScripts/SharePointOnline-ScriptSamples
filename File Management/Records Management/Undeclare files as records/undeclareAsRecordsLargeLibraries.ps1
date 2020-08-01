function Undeclare-Record
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
  $spqQuery.ViewXml ="<View Scope='RecursiveAll' /><Where><Eq><FieldRef Name='FileDirRef'/><Value Type='Text'>/sites/testflow/Customers/blank</Value></Eq></Where>";

 # $spqQuery.ViewXml ="<View Scope='RecursiveAll' />";
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
  $CounterNotRecord=0;
  $CounterUndeclared=0;
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
        
        [Boolean] $isRecord=[Microsoft.SharePoint.Client.RecordsRepository.Records]::IsRecord($rctx, $item)

        if(!$isRecord)
        {
            Write-Host "...This item is not a record." -ForegroundColor Yellow
            $CounterNotRecord++
            continue;
        }

         [Microsoft.SharePoint.Client.RecordsRepository.Records]::UndeclareItemAsRecord($rctx,$item)

         try
         {
            $rctx.ExecuteQuery()  
            Write-Host "...Item has been undeclared a record" -ForegroundColor Green
            $CounterUndeclared++
         }
         catch
         {
            Write-Host "...Item could not be undeclared a record" -ForegroundColor Red
            $CounterUnexpectedError++
         }     
  }

  Write-Host `n `n
  Write-Output "Execution finished." "$CounterFolder folders found and not processed." "$CounterNotRecord documents were not records." "$CounterUndeclared documents undeclared during this execution." "$CounterUnexpectedError unexpected errors occurred."

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



Undeclare-Record -Username $username -Url $Url -password $AdminPassword -ListTitle $ListTitle 