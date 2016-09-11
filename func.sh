function vmsnap()
{
	vm="$1"
	VBoxManage snapshot "$vm" take "bootstrapped" --description "bootstrapped so we save time"
}

function restorecurrent()
{
	vm="$1"
	VBoxManage controlvm $vm poweroff
	sleep 1
	VBoxManage snapshot $vm restorecurrent
	sleep 1
	VBoxHeadless --startvm $vm
}
