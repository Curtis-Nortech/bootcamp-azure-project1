#!/bin/bash

cat/proc/meminfo | grep memfree -i > ~/backups/freemem/free_mem.txt
du -h > ~/backups/diskuse/disk_usage.txt
lsof > ~/backups/openlist/open_list.txt
df -h --output=source,size,used,avail > ~/backups/freedisk/free_disk.txt