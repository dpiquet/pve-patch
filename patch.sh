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

echo "Trying patching Proxmox VE"

/usr/bin/patch /usr/share/pve-manager/ext4/pvemanagerlib.js -p0 <<EOF
--- /usr/share/pve-manager/ext4/pvemanagerlib.js	2013-10-23 07:02:55.000000000 +0200
+++ pvemanagerlib.js	2014-01-27 16:49:45.000000000 +0100
@@ -451,7 +451,7 @@ Ext.define('PVE.Utils', { statics: {
 	    success: function(response, opts) {
 		var data = response.result.data;
 
-		if (data.status !== 'Active') {
+		if (false && data.status !== 'Active') {
 		    Ext.Msg.show({
 			title: gettext('No valid subscription'),
 			icon: Ext.Msg.WARNING,
EOF

echo "Patch applied with status $?"
