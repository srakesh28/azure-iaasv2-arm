#!/bin/bash
az group list --query [].name --output tsv > rsaz.txt
while IFS='' read -r rg || [[ -n "$rg" ]]; do
    echo "Scanning Resource Group : $rg"
 az vm get-instance-view --ids $(az vm list -g $rg --query "[].id" -o tsv)
done < "$1"