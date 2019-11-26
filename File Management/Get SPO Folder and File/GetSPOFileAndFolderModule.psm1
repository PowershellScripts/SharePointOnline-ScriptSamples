
function Get-SPOFileByServerRelativeUrl
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ServerRelativeUrl     
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()

  $file =
        $ctx.Web.GetFileByServerRelativeUrl($ServerRelativeUrl);
        $ctx.Load($file)
        $ctx.ExecuteQuery()
        $Author=$file.Author
        $CheckedOutByUser=$file.CheckedOutByUser
        $LockedByUser=$file.LockedByUser
        $ModifiedBy=$file.ModifiedBy
        $ctx.Load($Author)
        $ctx.Load($CheckedOutByUser)
        $ctx.Load($LockedByUser)
        $ctx.Load($ModifiedBy)
        $ctx.ExecuteQuery()
        $obj = New-Object PSObject
        $obj | Add-Member NoteProperty Name($file.Name)
        $obj | Add-Member NoteProperty Author.LoginName($file.Author.LoginName)
        $obj | Add-Member NoteProperty CheckedOutByUser.LoginName($file.CheckedOutByUser.LoginName)
        $obj | Add-Member NoteProperty CheckinComment($file.CheckinComment)
        $obj | Add-Member NoteProperty ContentTag($file.ContentTag)
        $obj | Add-Member NoteProperty ETag($file.ETag)
        $obj | Add-Member NoteProperty Exists($file.Exists)
        $obj | Add-Member NoteProperty Length($file.Length)
        $obj | Add-Member NoteProperty LockedByUser.LoginName($file.LockedByUser.LoginName)
        $obj | Add-Member NoteProperty MajorVersion($file.MajorVersion)
        $obj | Add-Member NoteProperty MinorVersion($file.MinorVersion)
        $obj | Add-Member NoteProperty ModifiedBy.LoginName($file.ModifiedBy.LoginName)
        $obj | Add-Member NoteProperty ServerRelativeUrl($file.ServerRelativeUrl)
        $obj | Add-Member NoteProperty Tag($file.Tag)
        $obj | Add-Member NoteProperty TimeCreated($file.TimeCreated)
        $obj | Add-Member NoteProperty TimeLastModified($file.TimeLastModified)
        $obj | Add-Member NoteProperty Title($file.Title)
        $obj | Add-Member NoteProperty UIVersion($file.UIVersion)
        $obj | Add-Member NoteProperty UIVersionLabel($file.UIVersionLabel)
        
        Write-Output $obj



}








function Get-SPOFolderByServerRelativeUrl
{
param (
        [Parameter(Mandatory=$true,Position=1)]
		[string]$Username,
		[Parameter(Mandatory=$true,Position=2)]
		[string]$Url,
        [Parameter(Mandatory=$true,Position=3)]
		[string]$AdminPassword,
        [Parameter(Mandatory=$true,Position=4)]
		[string]$ServerRelativeUrl     
		)

$password = ConvertTo-SecureString -string $AdminPassword -AsPlainText -Force
  $ctx=New-Object Microsoft.SharePoint.Client.ClientContext($Url)
  $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Username, $password)
  $ctx.Load($ctx.Web)
  $ctx.ExecuteQuery()


  $folderCollection =
        $ctx.Web.GetFolderByServerRelativeUrl($ServerRelativeUrl).Folders;
        $ctx.Load($folderCollection)
        $ctx.ExecuteQuery()


        
        foreach ($fof in $folderCollection)
        {
        $obj = New-Object PSObject
        $ctx.Load($fof.ListItemAllFields)
        $ctx.ExecuteQuery()
        $obj | Add-Member NoteProperty Name($fof.Name)
        $obj | Add-Member NoteProperty Itemcount($fof.ItemCount)
        $obj | Add-Member NoteProperty WelcomePage($fof.WelcomePage)

        Write-Output $obj
        }



}

Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
 




 Export-ModuleMember -Function "Get-SPOFolderByServerRelativeUrl", "Get-SPOFileByServerRelativeUrl"