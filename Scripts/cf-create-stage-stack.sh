aws cloudformation create-stack --stack-name stagestlukesstack --template-body file://~/projects/cloudformation101/Stacks/Stage-RDS-EC2-Drupal7.yml --parameters ParameterKey=DBIDName,ParameterValue=stlukesdbstage ParameterKey=DBName,ParameterValue=stlukesdatabase ParameterKey=DBUser,ParameterValue=stlukesadmin ParameterKey=DBPassword,ParameterValue=Decode2020123098

