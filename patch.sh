#!/bin/bash

#################################################
#
#	PVE 3.x anti subscription popup patch
#
#################################################
#
#
#

#  Based on tolaris' patch:
#  http://www.tolaris.com/2013/08/28/removing-the-proxmox-3-1-subscription-nag-dialog/

echo "patching Proxmox VE"

/usr/bin/patch /usr/share/pve-manager/ext4/pvemanagerlib.js -i - <<EOF
--- /usr/share/pve-manager/ext4/pvemanagerlib.js.orig   2013-08-28 10:33:15.000000000 +0100
+++ /usr/share/pve-manager/ext4/pvemanagerlib.js        2013-08-28 10:37:52.000000000 +0100
@@ -447,7 +447,7 @@
            success: function(response, opts) {
                var data = response.result.data;

-               if (data.status !== 'Active') {
+               if (false && data.status !== 'Active') {
                    Ext.Msg.show({
                        title: gettext('No valid subscription'),
                        icon: Ext.Msg.WARNING,
EOF

echo "Patch applied with status $?"
