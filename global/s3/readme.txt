Description:

The following terraform files has been created to set up the back-end storage of statefiles which mimics the usual scenario when you have a team working on the same infrastructure
as code project. All of the resources created requires minimal cost and falls into the free tier that AWS provides. 

Resources created:
    - S3 Bucket -- Responsible for storage the statefiles
    - DynamoDB -- a document database responsible for facilitating the locking mechanism


Note on destroying the resources

S3 Bucket: 
    This currently has the parameter of prevent destroy to true. If you really want to delete the resource then this can be commented out before running terraform destroy





