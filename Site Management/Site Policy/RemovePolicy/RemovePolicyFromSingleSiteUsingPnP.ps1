Connect-PnPOnline

# First see the policies currently applied on the site

$ContentTypeID = "0x010085EC78BE64F9478AAE3ED069093B9963"
Get-PnPContentType | where {($_.Id -match $ContentTypeID) -and ($_.Id -notlike $ContentTypeID)} | select name, id

# Remove the policy you want

Remove-PnPContentType -Identity  NAMEOFYOURPOLICYFROMPREVIOUSCMDLET

# That's it :)
