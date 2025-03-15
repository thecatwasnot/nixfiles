# Add Public Key
Enable the user gpg and host yubikey configuration
Grab the public key from the transfers USB stick
Use `lsblk` to find the USB stick 
```
sudo mkdir /mnt
sudo mount /dev/sdX1 /mnt
gpg --import /mnt/*.asc
```
Or if the yubikey has the public key.
```
gpg --edit-card
gpg/card> fetch
gpg/card> quit
```

Determine the key ID
```
gpg -k
```
Then trust the key...
```
gpg --edit-key cole.teeter@gmail.com
gpg>trust
gpg>5
gpg>y
gpg>quit
```
Remove and re-insert the YubiKey.
Verify the status with `gpg --card-status`
