# <ins>Qubes Recovery

This document was written by my sanity, before it officially left, going on vacation from me. I managed to do some horrible things to my Qubes system, and maybe you will too. I had no documentation for this, you will. Thank me later

-----

- Prequesites:

  - USB drive with Qubes OS install media

  - Some command-line knowledge

  - Patience

<br>

-----

<br>

- <ins>1 - Find the right disk

  - Fire up your qubes installer, and select "Recover Qubes OS System". Let it boot and try the automatic recovery thing. It will most likely fail, but that doesnt matter.

  - Open a shell and list all disks & partitions

```console
fdisk -l
```
Given qubes nature, there might be **a lot**, dont be confused. Scroll up until you see one disk with **3** Entries. (600mb for efi, 1gb for boot, XXXgb for qubes-dom0/root), where XXX is your main disk size. Remember the 3 partition names. 

<br>

-----

<br>

- <ins>2 - Unlock your disk and mount everything

Now, follow these commands to have a semi-functional system to drop into. Replace nvme0.... with your disk / partitions

```console

# Decrypt your luks partition
cryptsetup luksOpen -v /dev/nvme0n1p3 qubes_dom0

# Now we mount all 3 main partitions
mount /dev/qubes_dom0/root /mnt
mount /dev/nvme0n1p2 /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot/efi

# Mount the rest we may need / want
mount -B /dev /mnt/dev
mount -B /proc /mnt/proc
mount -B /sys /mnt/sys
```

<br>

-----

<br>


- <ins>3 - Restoring order

Now, this depends on what went wrong. If its just something minor like your fstab or grub, 3a got you covered, if its your kernel, initramfs (Filesystem) or modules, go with 3b. If its even worse... I'm so sorry, but 3c is your only option

<details>
<summary><code>3a - fstab & Grub</code></summary>

<br>

- First, lets confirm our fstab is correct.

```console
# Drop into our dom0 shell
chroot /mnt

# Dont forget to keep replacing those nvme0... with your partitions
blkid -o value -s UUID /dev/nvme0n1p2
```
This command will show you the UUID for your boot partition. Repeat this command for the efi partition as well. Then run `nano /etc/fstab` and confirm that these two UUIDs match the contents in that file. If not, replace them.

Here is an example of a correct looking fstab:

![/etc/fstab](https://user-images.githubusercontent.com/55334727/227654353-65b8a196-c03c-4e32-974b-1ebb02edb4c8.png)

<br><br>

  - Now, lets get to work on grub. Luckily fixing that is really simple.

```console
# Fix grub
sudo nano /etc/default/grub

# Make dracut happy

# I dont fully understand why this is needed, nor am I sure if it always is. 
# From own experience I consider it good practice

# Replace 5.15.94-1 with your currently used kernel, usually the highest number in that folder


dracut -vf /boot/initramfs-5.15.94-1.qubes.fc32.x86_64.img


# Rebuild grub
sudo grub2-mkconfig -o /boot/efi/EFI/qubes/grub.cfg
```

Now, you should be back to a working grub. If however that made your dracut very unhappy, dont panic. I've been there. 3b will fix it.

<br>

-----

<br>
</details>

<details>
<summary><code>3b - Kernel, Filesystem & modules</code></summary>

<br>

So far everything could have been done with any live distro, but this step really requires the qubes installer.

If you previously did *3a*, and tried to boot to no avail, mount everything again. We will now copy the kernel & modules from the installer to recover even more broken systems. 

Once again, replace this with whatever number your installer has. Just let `tab` autocomplete wherever it can

```console
# Copy our Recovery Kernel
cp /boot/vmlinuz-5.15.94-1.qubes.fc32.x86_64 /mnt/boot

# Copy the initramfs filesystem
cp /boot/initramfs-5.15.94-1.qubes.fc32.x86_64.img /mnt/boot

# And copy our modules
cp -r /lib/modules/5.15.94-1.fc32.qubes.x86_64/ /mnt/lib/qubes
```

Now make sure your grub is fine by following  `3a` and boot your fixed system.

<br>

-----

<br>
</details>

<details>
<summary><code>3c - Emergency Backup</code></summary>

<br>

Why are you still here? What did you do? *sigh* I guess you will have to backup your qubes now, reinstall qubes and restore the backup. 

<br>

- Backing up Dom0

When backing up dom0 using the Qubes backup tool, only the home directory is backed up. Therefore, if you have files outside the home directory you wish to save, you should copy them into the home directory prior to creating a backup. Here is an example of how to back up Qubes config files and RPC policies:

```console
# Drop into our dom0 shell
chroot /mnt

# Create your backup folders
mkdir -p ~/backup/etc/qubes/
mkdir ~/backup/etc/qubes-rpc/

# Then simply copy all data to it
cp -a /etc/qubes/* ~/backup/etc/qubes/
cp -a /etc/qubes-rpc/* ~/backup/etc/qubes-rpc/
```

<br>

To restore these files, move them from the restored directory in dom0’s home back to their appropriate locations in /etc/. Please note that any packages installed via the package manager in dom0 will not be backed up. Such packages will have to be reinstalled through the package manager when restoring on a fresh installation.

<br>

  - Backup up our individual Qubes

```console
# First, we make our Qubes backup folder
mkdir -p ~/backup/qubes/

# Then you run the following command to start the backup of all qubes
qvm-backup ~/backup/qubes

# If you only want to backup specific qubes (Personal & coding for example)
qvm-backup ~/backup/qubes personal coding

```

<br>

- Moving the data onto a clean drive

You now want to copy this data onto another drive, stick or whatever. Technically you could also try to upload it through an APPVM to a cloud service (If your system is functional enough). But since that sounds rather unsecure, I will not go into detail there.

```console
# Now attach your drive / stick, and find it	
fdisk -l

# Make a backup folder on your drive (make sure to replace sdX with your medium again)
mkdir /dev/sdX/backup

# Copy all your data to the media (Replace YOUR_USERNAME with your username)
cp -r ~/backup /dev/sdX/backup

```

Now you can go ahead and re-install Qubes, and use the Qubes Restore GUI (Q -> Qubes Tools -> Restore Backups) to restore your individual Qubes. For the Dom0 backups, just add them back right where they were. For good measure, always reboot after loading a backup.

**BE CAREFUL THO: If a Dom0 Issue brought you here, you will be spending another hour repeating this process**

<br>

Note, if for some reason your are unable to ever get a working Qubes install again, dont panic. You can view the files of these backups by following [this guide](https://www.qubes-os.org/doc/backup-emergency-restore-v4/).

</details>

<br>

-----

<br>

Now, this is probably the most complete guide on how to fix qubes systems that refuse to boot after some changes. If you know other issues I could add fixes for in here, please let me know!

------

<p align="center">ClaraCrazy | CynthiaLabs - 2023
