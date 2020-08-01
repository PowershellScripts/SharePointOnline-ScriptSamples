Short script to retrieve all time zones from a single site in Sharepoint Online.
It does not change any settings, it just lists out possible options.

The script requires the following libraries. Please make sure the paths refer correct files on you machine:

```PowerShell
  # Paths to SDK. Please verify location on your computer.  
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "c:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.SharePoint.Client.Runtime\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.SharePoint.Client.Runtime.dll" 
``` 
Enter the correct data:

```PowerShell
# Insert the credentials and the name of the admin site 
$Username="user@tenant.onmicrosoft.com" 
$AdminPassword=Read-Host -Prompt "Password" -AsSecureString 
$url="https://tenant-my.sharepoint.com/personal/user_tenant_onmicrosoft_com"
``` 
 

## *Expected results:*

39 (UTC-12:00) International Date Line West95 (UTC-11:00) Coordinated Universal Time-1115 (UTC-10:00) Hawaii14 (UTC-09:00) Alaska78 (UTC-08:00) Baja California13 (UTC-08:00) Pacific Time (US and Canada)38 (UTC-07:00) Arizona77 (UTC-07:00) Chihuahua, La Paz, Mazatlan12 (UTC-07:00) Mountain Time (US and Canada)55 (UTC-06:00) Central America11 (UTC-06:00) Central Time (US and Canada)37 (UTC-06:00) Guadalajara, Mexico City, Monterrey36 (UTC-06:00) Saskatchewan35 (UTC-05:00) Bogota, Lima, Quito10 (UTC-05:00) Eastern Time (US and Canada)34 (UTC-05:00) Indiana (East)88 (UTC-04:30) Caracas91 (UTC-04:00) Asuncion9 (UTC-04:00) Atlantic Time (Canada)81 (UTC-04:00) Cuiaba33 (UTC-04:00) Georgetown, La Paz, Manaus, San Juan28 (UTC-03:30) Newfoundland8 (UTC-03:00) Brasilia85 (UTC-03:00) Buenos Aires32 (UTC-03:00) Cayenne, Fortaleza60 (UTC-03:00) Greenland90 (UTC-03:00) Montevideo103 (UTC-03:00) Salvador65 (UTC-03:00) Santiago96 (UTC-02:00) Coordinated Universal Time-0230 (UTC-02:00) Mid-Atlantic29 (UTC-01:00) Azores53 (UTC-01:00) Cabo Verde86 (UTC) Casablanca93 (UTC) Coordinated Universal Time2 (UTC) Dublin, Edinburgh, Lisbon, London31 (UTC) Monrovia, Reykjavik4 (UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna6 (UTC+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague3 (UTC+01:00) Brussels, Copenhagen, Madrid, Paris57 (UTC+01:00) Sarajevo, Skopje, Warsaw, Zagreb69 (UTC+01:00) West Central Africa83 (UTC+01:00) Windhoek79 (UTC+02:00) Amman5 (UTC+02:00) Athens, Bucharest, Istanbul80 (UTC+02:00) Beirut49 (UTC+02:00) Cairo98 (UTC+02:00) Damascus50 (UTC+02:00) Harare, Pretoria59 (UTC+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius101 (UTC+02:00) Istanbul27 (UTC+02:00) Jerusalem7 (UTC+02:00) Minsk (old)104 (UTC+02:00) E. Europe100 (UTC+02:00) Kaliningrad (RTZ 1)26 (UTC+03:00) Baghdad74 (UTC+03:00) Kuwait, Riyadh109 (UTC+03:00) Minsk51 (UTC+03:00) Moscow, St. Petersburg, Volgograd (RTZ 2)56 (UTC+03:00) Nairobi25 (UTC+03:30) Tehran24 (UTC+04:00) Abu Dhabi, Muscat54 (UTC+04:00) Baku106 (UTC+04:00) Izhevsk, Samara (RTZ 3)89 (UTC+04:00) Port Louis82 (UTC+04:00) Tbilisi84 (UTC+04:00) Yerevan48 (UTC+04:30) Kabul58 (UTC+05:00) Ekaterinburg (RTZ 4)87 (UTC+05:00) Islamabad, Karachi47 (UTC+05:00) Tashkent23 (UTC+05:30) Chennai, Kolkata, Mumbai, New Delhi66 (UTC+05:30) Sri Jayawardenepura62 (UTC+05:45) Kathmandu71 (UTC+06:00) Astana102 (UTC+06:00) Dhaka46 (UTC+06:00) Novosibirsk (RTZ 5)61 (UTC+06:30) Yangon (Rangoon)22 (UTC+07:00) Bangkok, Hanoi, Jakarta64 (UTC+07:00) Krasnoyarsk (RTZ 6)45 (UTC+08:00) Beijing, Chongqing, Hong Kong, Urumqi63 (UTC+08:00) Irkutsk (RTZ 7)21 (UTC+08:00) Kuala Lumpur, Singapore73 (UTC+08:00) Perth75 (UTC+08:00) Taipei94 (UTC+08:00) Ulaanbaatar20 (UTC+09:00) Osaka, Sapporo, Tokyo72 (UTC+09:00) Seoul70 (UTC+09:00) Yakutsk (RTZ 8)19 (UTC+09:30) Adelaide44 (UTC+09:30) Darwin18 (UTC+10:00) Brisbane76 (UTC+10:00) Canberra, Melbourne, Sydney43 (UTC+10:00) Guam, Port Moresby42 (UTC+10:00) Hobart99 (UTC+10:00) Magadan68 (UTC+10:00) Vladivostok, Magadan (RTZ 9)107 (UTC+11:00) Chokurdakh (RTZ 10)41 (UTC+11:00) Solomon Is., New Caledonia108 (UTC+12:00) Anadyr, Petropavlovsk-Kamchatsky (RTZ 11)17 (UTC+12:00) Auckland, Wellington97 (UTC+12:00) Coordinated Universal Time+1240 (UTC+12:00) Fiji92 (UTC+12:00) Petropavlovsk-Kamchatsky - Old67 (UTC+13:00) Nuku'alofa16 (UTC+13:00) Samoa
