function converge()
{
	vm="$1"

	PATH="/c/Program Files/Oracle/Virtualbox":$PATH

	time {

		time {
			chef update staging-Policyfile.rb &&
				chef push staging staging-Policyfile.rb
		}

		time knife winrm -m 127.0.0.1 \
			 --winrm-authentication-protocol basic \
			 --winrm-user Administrator \
			 --winrm-password Stre@mb0x 'chef-client -l warn';
	}
}

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
#	VBoxHeadless --startvm $vm &
	VBoxManage startvm --type headless $vm
}
