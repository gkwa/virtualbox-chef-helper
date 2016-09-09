function vmsnap()
{
	VBoxManage snapshot "$vm" take "bootstrapped" --description "bootstrapped so we save time"
}
export -f vmsnap

function restorecurrent()
{
	VBoxManage controlvm $vm poweroff
	sleep 1
	VBoxManage snapshot $vm restorecurrent
	sleep 1
	VBoxManage startvm --type headless $vm
}
export -f restorecurrent
