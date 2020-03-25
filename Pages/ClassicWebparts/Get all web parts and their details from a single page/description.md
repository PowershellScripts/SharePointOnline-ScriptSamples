Powershell script to get a web part and all its details from a single page.

 

The script requires the following libraries. Please confirm that the files are in the same location on your PC.

 

```PowerShell
  # Paths to SDK. Please verify location on your computer. 
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.SharePoint.Client.Runtime.dll" 
 ```
 

You need to enter your credentials and the page relative url:

 

```PowerShell
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="t@trial567.onmicrosoft.com" 
$Url="https://trial567.sharepoint.com/sites/powie64" 
 ```
 
Get-SPOWebParts -Username $username -Url $Url -password $AdminPassword -pageUrl "/sites/powie64/SitePages/pgie.aspx"
 
 

## Expected results:
<div width="80%">

```Id                 : 47e6cf64-6e6a-4cad-8873-6b563b63bdaeWebPart            : Microsoft.SharePoint.Client.WebParts.WebPartContext            : Microsoft.SharePoint.Client.ClientContextTag                : Path               : Microsoft.SharePoint.Client.ObjectPathIdentityObjectVersion      : ServerObjectIsNull : FalseTypedObject        : Microsoft.SharePoint.Client.WebParts.WebPartDefinition```
</br>```Associated web part:Hidden             : FalseIsClosed           : FalseProperties         : Microsoft.SharePoint.Client.PropertyValuesSubtitle           : Title              : MicroFeedTitleUrl           : /sites/powie64/Lists/PublishedFeedZoneIndex          : 0Context            : Microsoft.SharePoint.Client.ClientContextTag                : Path               : Microsoft.SharePoint.Client.ObjectPathPropertyObjectVersion      : ServerObjectIsNull : FalseTypedObject        : Microsoft.SharePoint.Client.WebParts.WebPart```
</br>```Key   : ExportModeValue : 0```
</br>```Key   : DirectionValue : 0```
</br>```Key   : ChromeStateValue : 0```
</br>```Key   : AllowCloseValue : True```
</br>```Key   : ChromeTypeValue : 0```
</br>```Key   : HeightValue : ```
</br>```Key   : WidthValue : ```
</br>```Key   : MissingAssemblyValue : Cannot import this Web Part.```
</br>```Key   : ImportErrorMessageValue : Cannot import this Web Part.```
</br>```Key   : AuthorizationFilterValue : ```
</br>```Key   : TitleIconImageUrlValue : ```
</br>```Key   : TitleUrlValue : /sites/powie64/Lists/PublishedFeed```
</br>```Key   : HiddenValue : False```
</br>```Key   : CatalogIconImageUrlValue : /_layouts/15/images/itgen.png?rev=41```
</br>```Key   : HelpModeValue : 1```
</br>```Key   : HelpUrlValue : ```
</br>```Key   : TitleValue : MicroFeed```
</br>```Key   : DescriptionValue : MySite MicroFeed Persistent Storage List```
</br>```Key   : AllowConnectValue : True```
</br>```Key   : AllowMinimizeValue : True```
</br>```Key   : AllowHideValue : True```
</br>```Key   : AllowEditValue : True```
</br>```Key   : AllowZoneChangeValue : True```
</br>```Key   : UseSQLDataSourcePagingValue : True```
</br>```Key   : DataSourceIDValue : ```
</br>```Key   : PageSizeValue : -1```
</br>```Key   : DataSourcesStringValue : ```
</br>```Key   : SampleDataValue : ```
</br>```Key   : DataFieldsValue : ```
</br>```Key   : ShowWithSampleDataValue : False```
</br>```Key   : XslValue : ```
</br>```Key   : DefaultValue : ```
</br>```Key   : ListUrlValue : ```
</br>```Key   : ViewContentTypeIdValue : ```
</br>```Key   : EnableOriginalValueValue : False```
</br>```Key   : DisplayNameValue : ```
</br>```Key   : ListDisplayNameValue : ```
</br>```Key   : ViewFlagsValue : 8388621```
</br>```Key   : PageTypeValue : 1```
</br>```Key   : ListNameValue : {C8769590-0920-44EB-A030-9B05775C6B19}```
</br>```Key   : ListIdValue : c8769590-0920-44eb-a030-9b05775c6b19```
</br>```Key   : XmlDefinitionLinkValue : ```
</br>```Key   : XmlDefinitionValue : <View Name="{47E6CF64-6E6A-4CAD-8873-6B563B63BDAE}" MobileView="TRUE" Type="HTML" Hidden="TRUE" DisplayName="" Url="/sites/powie64/SitePages/pgie.aspx" Level="1"         BaseViewID="1" ContentTypeID="0x" ImageUrl="/_layouts/images/generic.png" ><Query><OrderBy><FieldRef Name="Created_x0020_Date"/></OrderBy></Query><ViewFields><FieldRef         Name="LinkTitleNoMenu"/><FieldRef Name="MicroBlogType"/><FieldRef Name="PostAuthor"/><FieldRef Name="DefinitionId"/><FieldRef Name="RootPostID"/><FieldRef         Name="RootPostUniqueID"/><FieldRef Name="RootPostOwnerID"/><FieldRef Name="UniqueId"/><FieldRef Name="ReplyCount"/><FieldRef Name="Created"/><FieldRef         Name="Modified"/><FieldRef Name="Author"/><FieldRef Name="Editor"/><FieldRef Name="ID"/><FieldRef Name="ReferenceID"/><FieldRef Name="Attributes"/><FieldRef         Name="Content"/><FieldRef Name="ContentData"/><FieldRef Name="SearchContent"/><FieldRef Name="RefRoot"/><FieldRef Name="RefReply"/><FieldRef Name="PostSource"/><FieldRef         Name="PeopleCount"/><FieldRef Name="PeopleList"/><FieldRef Name="MediaLinkType"/><FieldRef Name="MediaLinkDescription"/><FieldRef Name="MediaLinkURI"/><FieldRef         Name="MediaLinkUISnippet"/><FieldRef Name="MediaLinkContentURI"/><FieldRef Name="MediaLength"/><FieldRef Name="MediaWidth"/><FieldRef Name="MediaHeight"/><FieldRef         Name="MediaActionClickUrl"/><FieldRef Name="MediaActionClickKind"/><FieldRef Name="eMailSubscribers"/><FieldRef Name="eMailUnsubscribed"/><FieldRef         Name="LikesCount"/><FieldRef Name="LikedBy"/></ViewFields><RowLimit Paged="TRUE">100</RowLimit><XslLink>main.xsl</XslLink><Toolbar Type="None"/></View>```
</br>```Key   : CacheXslTimeOutValue : 86400```
</br>```Key   : FireInitialRowValue : True```
</br>```Key   : CacheXslStorageValue : True```
</br>```Key   : AutoRefreshIntervalValue : 60```
</br>```Key   : AutoRefreshValue : False```
</br>```Key   : AsyncRefreshValue : False```
</br>```Key   : ManualRefreshValue : False```
</br>```Key   : XslLinkValue : ```
</br>```Key   : WebIdValue : 00000000-0000-0000-0000-000000000000```
</br>```Key   : IsClientRenderValue : False```
</br>```Key   : GhostedXslLinkValue : main.xsl```
</br>```Key   : JSLinkValue : ```
</br>```Key   : BaseXsltHashKeyValue : ```
</br>```Key   : NoDefaultStyleValue : ```
</br>```Key   : ServerRenderValue : False```
</br>```Key   : InplaceSearchEnabledValue : True```
</br>```Key   : InitialAsyncDataFetchValue : False```
</br>```Key   : ShowTimelineIfAvailableValue : True```
</br>```Key   : DisableViewSelectorMenuValue : False```
</br>```Key   : DisableSaveAsNewViewButtonValue : False```
</br>```Key   : ViewFlagValue : ```
</br>```Key   : DataSourceModeValue : 0```
</br>```Key   : HasClientDataSourceValue : False```
</br>```Key   : SelectParametersValue : ```
</br>```Key   : ParameterBindingsValue :   <ParameterBinding Name="dvt_sortdir" Location="Postback;Connection"/>                    <ParameterBinding Name="dvt_sortfield" Location="Postback;Connection"/>                    <ParameterBinding Name="dvt_startposition" Location="Postback" DefaultValue=""/>                    <ParameterBinding Name="dvt_firstrow" Location="Postback;Connection"/>                    <ParameterBinding Name="OpenMenuKeyAccessible" Location="Resource(wss,OpenMenuKeyAccessible)" />                    <ParameterBinding Name="open_menu" Location="Resource(wss,open_menu)" />                    <ParameterBinding Name="select_deselect_all" Location="Resource(wss,select_deselect_all)" />                    <ParameterBinding Name="idPresEnabled" Location="Resource(wss,idPresEnabled)" /> <ParameterBinding Name="NoAnnouncements"         Location="Resource(wss,noXinviewofY_LIST)" />                   <ParameterBinding Name="NoAnnouncementsHowTo" Location="Resource(core,noXinviewofY_DEFAULT)" />                   <ParameterBinding Name="AddNewAnnouncement" Location="Resource(wss,addnewitem)" />                   <ParameterBinding Name="MoreAnnouncements" Location="Resource(wss,moreItemsParen)" />```

</div>
 
<img src="../Get all web parts and their details from a single page/GetAllWebpartsResult.PNG">
 

