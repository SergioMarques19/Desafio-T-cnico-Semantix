resource "aws_quicksight_data_source" "semantix" {
  data_source_id = "semantix-id"
  name           = "My Cool Data in Athena"

"DataSourceId": "semantix-id",
   "DataSourceParameters": { 
     "AthenaParameters": { 
     "WorkGroup": "dadossemantix"
}
  type = "athena"
}
}