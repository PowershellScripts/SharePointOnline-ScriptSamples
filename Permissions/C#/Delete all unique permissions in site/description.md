A little console application that restores inherited permissions for all the items in a site collection. It is equivalent of the button "Delete Unique Permissions" in the Permission Settings for a document/library or a site.

<img src="../Delete all unique permissions in site/DeleteUniki.png">

The code deletes unique permissions in:

- files

- list items

- folders

- subfolders and their content

- lists and libraries

- sites/subsites

 

It will NOT delete unique permissions in:

- root site collection for the collection  (by design). It will delete unique permissions for all the CONTENT of a site collection

- list and libraries which exceeded the limit of 5000 items (by design)

 

 

 

At the end a simple report will be generated in ```C:\Users\Public```

 

Below you can find full function reponsible for the deleting unique permissions - don't hesitate to improve and comment on it in the Q&A section!
