#!/bin/bash
# Pedro Pavan

VM_NAME=$(basename $(pwd))

which vagrant > /dev/null

if [ $? -ne 0 ]; then
	echo -e "Vagrant is not installed!\nAborting..."
	exit 2
fi

echo "Setting configuration for machine '${VM_NAME}'"
for file in $(ls -1 | grep -v 'init.sh'); do
	echo "==> ${VM_NAME}: adjust file ${file}"
	sed -i "s/%name%/${VM_NAME}/g" ${file}
done

vagrant up

exit 0
