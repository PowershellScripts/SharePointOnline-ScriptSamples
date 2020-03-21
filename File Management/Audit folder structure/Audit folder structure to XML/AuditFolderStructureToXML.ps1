function Get-folders()
{

param (

    [Parameter(Mandatory=$true,Position=0)]
    $higherLevelFolder,
    [Parameter(Mandatory=$true,Position=1)]
    [string]$OriginalLibrary
    )

    $Host.Runspace.ThreadOptions = “ReuseThread”
    $global:foldersCollection+=$higherLevelFolder.ServerRelativeUrl   #optional. Serves only to output a list of folders after script execution

    $ctx.Load($higherLevelFolder.Folders)
    $ctx.ExecuteQuery()
    Write-Verbose $higherLevelFolder.ServerRelativeUrl  $higherLevelFolder.Folders.Count

    #Add the current folder to XML file with attributes "name" and "number of subfolders". You can expand the number of attributes
    Add-XMLNode -folderServerRelativeUrl $higherLevelFolder.ServerRelativeUrl -XMLPath $script:XMLPath -folderName $higherLevelFolder.Name -noOfSubfolders $higherLevelFolder.Folders.Count -LibraryTitle $OriginalLibrary

    #loop through all subfolders
    foreach($lowerLevelFolder in $higherLevelFolder.Folders)
    {
        Get-folders -higherLevelFolder $lowerLevelFolder -OriginalLibrary $OriginalLibrary 
    }
}



function Get-Webfolders()
{
param (
    #title of the library you are auditing
    [Parameter(Mandatory=$true,Position=0)]
    [string]$OriginalLibrary
)

    $Host.Runspace.ThreadOptions = “ReuseThread”

    $OriginalList=$ctx.Web.Lists.GetByTitle($OriginalLibrary)

    # get first level folders from a library
    $folderCollectionFirstLevel=$OriginalList.RootFolder.Folders
    $ctx.load($OriginalList)
    $ctx.Load($folderCollectionFirstLevel)
    $ctx.ExecuteQuery()
    $OriginalLibrary="/"+$OriginalLibrary+"/"
    
    foreach($folder in $folderCollectionFirstLevel)
    {   
        Get-folders -higherLevelFolder $folder -OriginalLibrary $OriginalLibrary        
    }
}


function Create-XML()
{
    param (
        # Path to XML file
        [Parameter(Mandatory=$true,Position=0)]
        [string]$XMLPath
    )
    
     $xmlWriter = New-Object System.XMl.XmlTextWriter($XMLPath,$Null)
     $xmlWriter.WriteStartDocument()
     $xmlWriter.WriteComment('Get the Information about the folder structure')
     $xmlWriter.WriteStartElement('Folders')
     $xmlWriter.Flush()
     $xmlWriter.Close()

     $xmlDoc = [System.Xml.XmlDocument](Get-Content $XMLPath);
     $xmlDoc.Save($XMLPath)
    
}


function Add-XMLNode()
{
    param (

        [Parameter(Mandatory=$true,Position=1)]
        [string]$folderServerRelativeUrl,
        [Parameter(Mandatory=$true,Position=0)]
        [string]$XMLPath,
        [Parameter(Mandatory=$true,Position=2)]
        [string]$folderName,
        [Parameter(Mandatory=$true,Position=3)]
        [int]$noOfSubfolders,
        [Parameter(Mandatory=$true,Position=4)]
        [string]$libraryTitle    
    )

    $xmlDoc = [System.Xml.XmlDocument](Get-Content $XMLPath);
    $stringtoReplace = $libraryTitle
    $perspectivenode = "//Folders/"+ $folderServerRelativeUrl.Replace($stringtoReplace,"")
    Write-Host "Creating perspective node: " $perspectivenode

    $root = $xmlDoc.DocumentElement;

    #how many slashes are in the relative url apart from 3 slashes here: //Folders/  That allows later to decide at what level the folder is and how deeply we iterate through the nodes
    $countOfLevels = ($perspectivenode.Length - ($perspectivenode.replace("/","").Length))-3
    Write-Host "Levels: " $countOfLevels 

    if($countOfLevels -eq 0)
    {
        Write-Output $xmlDoc
        $folderNode = $xmlDoc.CreateElement("Folder")
        $xmlDoc.SelectSingleNode("/Folders").AppendChild($folderNode)
        $folderNode.SetAttribute("Name", $folderName) 
        $folderNode.SetAttribute("NumberOfSubfolders", $noOfSubfolders) 
        $xmlDoc.Save($XMLPath)
    }
    elseif($countOfLevels -gt 0)
    {
        $nodePath="//Folders/"
        $tempRelativeUrl=$perspectivenode.Replace("//Folders/","")
        $node = $XMLDoc.SelectSingleNode("Folders")
        
        #get the parent node. Assume that both folder names and entire paths may repeat 
        for($level=0; $level -lt $countOfLevels; $level++)
        {
           $nameOfTheUpperFolder = $tempRelativeUrl.Remove($tempRelativeUrl.IndexOf("/"))
           Write-Host "nameoftheupperfolder " $nameOfTheUpperFolder
           $node=$node.SelectNodes("Folder[@Name='$nameOfTheUpperFolder']")

           $tempRelativeUrl = $tempRelativeUrl.Remove(0,($tempRelativeUrl.IndexOf("/")+1))
           Write-Host "temprelativerl :" $tempRelativeUrl
        }

        $folderNode = $xmlDoc.CreateElement("Folder")
        $node.AppendChild($folderNode)
        $folderNode.SetAttribute("Name", $folderName) 
        $folderNode.SetAttribute("NumberOfSubfolders", $noOfSubfolders) 
        $xmlDoc.Save($XMLPath)

    }
    else 
    {
        Write-Error "Bubu was made"
    }

}


function Connect-SPO()
{

param (

    [Parameter(Mandatory=$true,Position=1)]
    [string]$Username,
    [Parameter(Mandatory=$true,Position=2)]
    [string]$Url,
    [Parameter(Mandatory=$true,Position=3)]
    $AdminPassword

    )

    $global:ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
    $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $AdminPassword)
    $ctx.Load($ctx.Web)
    $ctx.ExecuteQuery()

}

# Paths to SDK. Please verify location on your computer.

Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll" 


# Enter your data
$admin="ana@etr56.onmicrosoft.com"
$site="https://etr56.sharepoint.com"
$libraryTitle="test"
$script:XMLPath = "C:\Users\Public\foolders2.xml"
#Enter your data above!


#Do not modify lines below
$global:ctx
$global:foldersCollection=@()   #optional. Serves only to output a list of folders after script execution

$pass=Read-Host "Enter Password: " -AsSecureString 

Create-XML -XMLPath $XMLPath
Connect-SPO -Username $admin -Url $site -AdminPassword $pass
Get-Webfolders -OriginalLibrary $libraryTitle -ErrorAction Continue

#optional
Write-Output $global:foldersCollection





