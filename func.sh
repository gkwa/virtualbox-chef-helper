function vmsnap()
{
	export vm=efull
	VBoxManage snapshot "$vm" take "bootstrapped" --description "bootstrapped so we save time"
}
export -f vmsnap

# parallel --tag --nonall --no-notice -S taylordesktop --env vmsnap vmsnap

# on workstation/mbp
function restorecurrent()
{
	export vm=efull
	VBoxManage controlvm $vm poweroff; sleep 1; VBoxManage snapshot $vm restorecurrent; sleep 1; VBoxManage startvm --type headless $vm
}
export -f restorecurrent

# parallel --tag --nonall --no-notice -S taylordesktop --env restorecurrent restorecurrent
