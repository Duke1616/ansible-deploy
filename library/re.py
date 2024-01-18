from ansible.module_utils.basic import AnsibleModule  
import re
def mkversion(major, minor, patch):
        return (1000 * 1000 * int(major)) + (1000 * int(minor)) + int(patch)

def get_lvm_version(module):
    ver_cmd = module.get_bin_path("lvm", required=True)
    rc, out, err = module.run_command("%s version" % (ver_cmd))
    if rc != 0:
        return None
    m = re.search("LVM version:\s+(\d+)\.(\d+)\.(\d+).*(\d{4}-\d{2}-\d{2})", out)
    if not m:
        return None
    return mkversion(m.group(1), m.group(2), m.group(3))

def main():
    module = AnsibleModule(
        argument_spec=dict(
            vg=dict(required=True),
            lv=dict(required=True),
            size=dict(type='str'),
            opts=dict(type='str'),
            state=dict(choices=["absent", "present"], default='present'),
            force=dict(type='bool', default='no'),
            snapshot=dict(type='str', default=None),
        ),
        supports_check_mode=True,
    )

    # Determine if the "--yes" option should be used
    version_found = get_lvm_version(module)
    if version_found == None:
        print(1)
        module.fail_json(msg="Failed to get LVM version number")
    version_yesopt = mkversion(2, 2, 99) # First LVM with the "--yes" option
    if version_found >= version_yesopt:
        print(2)
        yesopt = "--yes"
        module.fail_json(msg="qqq")
    else:
        print(3)
        yesopt = ""
        module.fail_json(msg="www")


if __name__ == '__main__':
    main()

