rails g scaffold study name:string label:string abstract:text universe:text
rails g scaffold study_unit name:string label:string abstract:text study_id:integer
rails g scaffold logical_product name:string label:string abstract:text study_unit_id:integer
rails g scaffold data_collection name:string label:string abstract:text study_unit_id:integer
rails g scaffold group name:string label:string abstract:text study_id:integer
rails g scaffold physical_data_product name:string label:string group_id:integer logical_product_id:integer
rails g scaffold concept_group name:string label:string abstract:text
rails g scaffold concept name:string label:string abstract:text concept_group_id:integer
rails g scaffold question name:string label:string fix_name:string description:text
rails g scaffold variable_group name:string label:string logical_product_id:integer question_id:integer concept_id:integer
rails g scaffold variable name:string label:string physical_data_product_id:integer variable_group_id:integer
