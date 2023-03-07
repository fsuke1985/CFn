export P_NETWORK=$(cat << EOF
ParameterKey=SubnetPublicCidrBlock,ParameterValue=192.168.61.128/25
ParameterKey=SubnetPrivateCidrBlock,ParameterValue=192.168.61.0/25
ParameterKey=VpcCidr,ParameterValue=192.168.61.0/24 
EOF
)

export P_RDS=$(cat << EOF
ParameterKey=DBUsername,ParameterValue=administrator
ParameterKey=DBPassword,ParameterValue='sdkfj$o52143#FSS'
ParameterKey=DBSubnetGroupName,ParameterValue=ctvgroups
ParameterKey=Subnet1Id,ParameterValue=192.168.61.0/24 
ParameterKey=Subnet2Id,ParameterValue=192.168.61.0/24 
EOF
)