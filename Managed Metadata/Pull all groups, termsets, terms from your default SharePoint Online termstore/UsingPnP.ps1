
Connect-PNPOnline https://TENANT-admin.sharepoint.com -Credentials $myPsCred
$Context = Get-PnPContext

$Groups = Get-PNPTermGroup

Foreach($group in $Groups){
    
    $termsets = Get-PnPTermset -TermGroup $group
    
    Write-Output "$($Group.Name) group  with $($termsets.Count) termsets"
    
    Foreach($termset in $termsets){

        $termset.Name
        $terms = $termset.Terms
        $Context.Load($terms)            # You cannot get all terms using Get-PnPTerm  cmdlet
        $Context.ExecuteQuery()


        foreach ($term in $terms){

            Write-Output "$($term.Name)"
 }
    }
}
