Zip contains an ```.exe``` file which runs a program to add a list to a specified SharePoint site collection. You can choose the list template from among:

**contact list**

**announcement list**

**task list**

**event list**

You can choose the number of items. Each list is created individually with different columns and different data. The data which populates the list comes from a Random() function. Some of the fields, however, intentionally have the same values to let you test filtering in your SharePoint Online tenant.

The program is meant mainly for  testing purposes, e.g.

- creating a test environment for your company

- recreating big data and a lot of items without resorting to Excel and QuickEdit

- troubleshooting issues which occur when your users added more than 5000 items and you don't want or can't test on the real data

As it runs, it will inform you on the percentage of its progress.

## Error handling:

There is no error handling in this tool. It is designed for admins who know what to do with them.


## Expected errors:

The lists are named after the number of elements they include so be careful not to create another one with the same number on the same site collection - you will get an error!

SPO has an unchangeable view limit for lists and it is 5000 elements. With this tool you can go way above the SharePoint limit of 5000 items (tested with 17 000), so if you decide to create a list with 40 000 elements, expect some issues there. For your convenience, I created a default view for announcements list with 70 items limit. You can easily switch between the views in the GUI. 




<br/><br/>
<b>Enjoy and please share feedback!</b>
