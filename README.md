# simRaid1
Implement a(n _almost_) RAID 1 system from a batch file.

`v1.0   [2020-01-04]`

```
Usage:
  simRaid1.cmd <source_dir>\ <destination_dir>\ [-f]
```

`simRaid1` allows you to _basically_ implement a RAID 1 system from a batch file. It's not exactly realtime,
but it's close enough for most use cases. It essentially uses `robocopy` to mirror one folder/drive/whatever to another. 

It runs the `robocopy` command in an inifinite loop, which checks to see what files have been modified in the source and then only re-writes/modifies those in the destination.

It comes in handy when setting up RAID from `Disk Management` isn't an option (for example, if you're dealing with are USB drives), or if you just want to mirror two folders.

The `-f` flag speeds operations up, making the script run closer to realtime, but this means that you won't be shown the ETA, junction points will be excluded and that the number of retries in case of failures and wait times between failures are reduced.

In default mode, the script will retry thrice if it can't read a file, waiting for 3 seconds between each try.  
In fast mode, the script will retry once if it can't read a file, after a 1 second wait. 
You can, of course, change these values in the script.

This script is inferior to regular RAID 1 in many ways, _except_:

 - It works with (sub-)folders, not just drives.  
 - It allows you to first decrypt an encrypted drive and then start the mirroring process, which is something that cannot be done with `Disk Management`'s mirror functionality.  
 - If the drive you're mirroring to is slower than the main drive (for eg, backing up to an HDD from an SSD), write speeds on the main drive are not affected by the write speeds of the slower drive.  
 - It works with USB/external drives, unlike `Disk Management`
 
