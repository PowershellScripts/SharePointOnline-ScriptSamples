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
    $ctx.Load($higherLevelFolder.Files)
    $ctx.ExecuteQuery()
    Write-Host $higherLevelFolder.ServerRelativeUrl  $higherLevelFolder.Folders.Count

    #Add the current folder to XML file with attributes "name" and "number of subfolders". You can expand the number of attributes
    Add-XMLNode -folderServerRelativeUrl $higherLevelFolder.ServerRelativeUrl -XMLPath $script:XMLPath -folderName $higherLevelFolder.Name -noOfSubfolders $higherLevelFolder.Folders.Count -LibraryTitle $OriginalLibrary -folderItemCount $higherLevelFolder.ItemCount -file $false

    $higherLevelFolderFiles = $higherLevelFolder.Files

    foreach($file in $higherLevelFolderFiles)
    {
        
        Write-Host $file.Name
        $ctx.Load($file)
        $ModifiedBy=$file.ModifiedBy
        $ctx.Load($ModifiedBy)
        $ctx.ExecuteQuery()
        $fileSize = [Math]::Round(($file.Length/1MB),2)
        Write-Host $file.ServerRelativeUrl 
        Add-XMLNode -fileName $file.Name -folderServerRelativeUrl $file.ServerRelativeUrl -XMLPath $script:XMLPath -fileSize $fileSize -libraryTitle $OriginalLibrary -file $true -fileTimeCreated $file.TimeCreated -fileLastModified $file.TimeLastModified -fileModifiedBy $ModifiedBy.LoginName 

    }


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
        # TODO: could split into two parameter sets DONE
        [Parameter(Mandatory=$true, ParameterSetName='File',Position=1)]
        [Parameter(Mandatory=$true, ParameterSetName='Folder',Position=1)]
        [string]$folderServerRelativeUrl,
        [Parameter(Mandatory=$true, ParameterSetName='Folder',Position=0)]
        [Parameter(Mandatory=$true, ParameterSetName='File',Position=0)]
        [string]$XMLPath,
        [Parameter(Mandatory=$true, ParameterSetName='Folder',Position=2)]
        [string]$folderName,
        [Parameter(Mandatory=$true, ParameterSetName='Folder',Position=3)]
        [int]$noOfSubfolders,
        [Parameter(Mandatory=$true, ParameterSetName='Folder',Position=4)]
        [Parameter(Mandatory=$true, ParameterSetName='File',Position=4)]
        [string]$libraryTitle,
        [Parameter(Mandatory=$true, ParameterSetName='Folder',Position=5)]
        [int]$folderItemCount,
        [Parameter(Mandatory=$true, ParameterSetName='File',Position=7)]
        [Parameter(Mandatory=$true, ParameterSetName='Folder',Position=7)]
        [bool]$file,
        [Parameter(Mandatory=$true, ParameterSetName='File')]
        [string]$fileSize,
        [Parameter(Mandatory=$true, ParameterSetName='File')]
        [string]$fileTimeCreated,
        [Parameter(Mandatory=$true, ParameterSetName='File')]
        [string]$fileLastModified,
        [Parameter(Mandatory=$true, ParameterSetName='File')]
        [string]$fileModifiedBy,
        [Parameter(Mandatory=$true, ParameterSetName='File')]
        [string]$fileName             
    )

    $xmlDoc = [System.Xml.XmlDocument](Get-Content $XMLPath);
    $stringtoReplace = $libraryTitle
    $perspectivenode = "//Folders/"+ $folderServerRelativeUrl.Replace($stringtoReplace,"")
    Write-Host "Creating perspective node: " $perspectivenode

    $root = $xmlDoc.DocumentElement;

    #how many slashes are in the relative url apart from 3 slashes here: //Folders/  That allows later to decide at what level the folder is and how deeply we iterate through the nodes
    $countOfLevels = ($perspectivenode.Length - ($perspectivenode.replace("/","").Length))-3
    Write-Host "Levels: " $countOfLevels 

    $newNode;
    $nameOfNewNode;

    if($file)
    {
        $nameOfNewNode = "File"
    }
    else
    {
        $nameOfNewNode = "Folder"
    }


    $newNode = $xmlDoc.CreateElement($nameOfNewNode)

    #gets the parent node. For top level files&folders and separately for deeper structure
    if($countOfLevels -eq 0)
    {               
        $xmlDoc.SelectSingleNode("/Folders").AppendChild($newNode)
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

        $node.AppendChild($newNode)
    }
    else 
    {
        Write-Error "Bubu was made"
    }



    # Sets the attributes of the node. The attributes differ between file and folder
    if($file)
    {
        $newNode.SetAttribute("Name", $fileName) 
        $newNode.SetAttribute("SizeInMB", $fileSize) 
        $newNode.SetAttribute("Created", $fileTimeCreated)
        $newNode.SetAttribute("Modified", $fileLastModified)
        $newNode.SetAttribute("ModifiedBy", $fileModifiedBy)
    }
    else
    {
        #if you want less attributes in the xml file, remove some of these lines
        $newNode.SetAttribute("Name", $folderName) 
        $newNode.SetAttribute("NumberOfSubfolders", $noOfSubfolders) 
        $newNode.SetAttribute("ItemCount", $folderItemCount)
        $newNode.SetAttribute("ServerRelativeUrl", $folderServerRelativeUrl)
    }

    #Saves the new node
    $xmlDoc.Save($XMLPath)

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
$script:XMLPath = "C:\Users\Public\foolders2new2.xml"
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





