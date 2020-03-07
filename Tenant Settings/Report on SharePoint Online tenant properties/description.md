Short Powershell script to export SharePoint Online tenant properties. It will display values for the following properties:

 

AllowedDomainListForSyncClient                 : {}

BccExternalSharingInvitations                  : False

BccExternalSharingInvitationsList              : 

BlockDownloadOfAllFilesForGuests               : False

BlockDownloadOfAllFilesOnUnmanagedDevices      : False

BlockDownloadOfViewableFilesForGuests          : False

BlockDownloadOfViewableFilesOnUnmanagedDevices : False

BlockMacSync                                   : False

CommentsOnSitePagesDisabled                    : False

CompatibilityRange                             : 15,15

DefaultSharingLinkType                         : AnonymousAccess

DisableReportProblemDialog                     : False

DisallowInfectedFileDownload                   : False

DisplayStartASiteOption                        : True

EnableGuestSignInAcceleration                  : False

ExcludedFileExtensionsForSyncClient            : {}

ExternalServicesEnabled                        : True

FileAnonymousLinkType                          : Edit

FolderAnonymousLinkType                        : Edit

HideSyncButtonOnODB                            : False

IPAddressAllowList                             : 

IPAddressEnforcement                           : False

IPAddressWACTokenLifetime                      : 15

IsUnmanagedSyncClientForTenantRestricted       : False

IsUnmanagedSyncClientRestrictionFlightEnabled  : True

LegacyAuthProtocolsEnabled                     : True

NoAccessRedirectUrl                            : 

NotificationsInOneDriveForBusinessEnabled      : True

NotificationsInSharePointEnabled               : True

NotifyOwnersWhenInvitationsAccepted            : True

NotifyOwnersWhenItemsReshared                  : True

ODBAccessRequests                              : Unspecified

ODBMembersCanShare                             : Unspecified

OfficeClientADALDisabled                       : False

OneDriveForGuestsEnabled                       : False

OneDriveStorageQuota                           : 1048576

OptOutOfGrooveBlock                            : False

OptOutOfGrooveSoftBlock                        : False

OrphanedPersonalSitesRetentionPeriod           : 30

OwnerAnonymousNotification                     : True

PermissiveBrowserFileHandlingOverride          : False

PreventExternalUsersFromResharing              : False

ProvisionSharedWithEveryoneFolder              : False

PublicCdnAllowedFileTypes                      : CSS,EOT,GIF,ICO,JPEG,JPG,JS,MAP,PNG,SVG,TTF,WOFF

PublicCdnEnabled                               : False

PublicCdnOrigins                               : {}

RequireAcceptingAccountMatchInvitedAccount     : False

RequireAnonymousLinksExpireInDays              : 0

ResourceQuota                                  : 5300

ResourceQuotaAllocated                         : 1700

RootSiteUrl                                    : https://cfschulung.sharepoint.com

SearchResolveExactEmailOrUPN                   : False

SharingAllowedDomainList                       : 

SharingBlockedDomainList                       : 

SharingCapability                              : ExternalUserAndGuestSharing

SharingDomainRestrictionMode                   : None

ShowAllUsersClaim                              : True

ShowEveryoneClaim                              : True

ShowEveryoneExceptExternalUsersClaim           : True

ShowNGSCDialogForSyncOnODB                     : True

ShowPeoplePickerSuggestionsForGuestUsers       : False

SignInAccelerationDomain                       : 

SpecialCharactersStateInFileFolderNames        : Allowed

StartASiteFormUrl                              : 

StorageQuota                                   : 1061376

StorageQuotaAllocated                          : 576716800

UseFindPeopleInPeoplePicker                    : False

UsePersistentCookiesForExplorerView            : False

UserVoiceForFeedbackEnabled                    : True

Context                                        : Microsoft.SharePoint.Client.ClientContext

Tag                                            : 

Path                                           : Microsoft.SharePoint.Client.ObjectPathIdentity

ObjectVersion                                  : 

ServerObjectIsNull                             : False

TypedObject 

 

 

 Expected results


 

 

 

### How to use?
Download and open the .ps1 file.
Add correct libraries:
 

```PowerShell
#Paths to SDK 
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.Online.SharePoint.Client.Tenant.dll"   
``` 
Enter the correct url and admin login: 
```PowerShell
#Enter the data 
$AdminPassword=Read-Host -Prompt "Enter password" -AsSecureString 
$username="arleta@TENANT.onmicrosoft.com" 
$Url="https://Tenant-admin.sharepoint.com" 
$CSVPath="C:\Users\Public\testTenantSettings.csv"
``` 
  Run the script
 

 
