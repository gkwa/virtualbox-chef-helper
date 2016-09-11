function vmsnap()
{
	vm="$1"

	PATH="/c/Program Files/Oracle/Virtualbox":$PATH

	VBoxManage snapshot "$vm" take "bootstrapped" --description "bootstrapped so we save time"
}

function restorecurrent()
{
	vm="$1"

	PATH="/c/Program Files/Oracle/Virtualbox":$PATH

	VBoxManage controlvm $vm poweroff
	sleep 1
	VBoxManage snapshot $vm restorecurrent
	sleep 1
	VBoxManage startvm --type headless $vm
}
