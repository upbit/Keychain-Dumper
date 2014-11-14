# Keychain Dumper

## Usage

All that should be needed to use keychain_dumper is the binary that is checked in to the Keychain-Dumper Git repository.  This binary has been signed with a self-signed certificate with a "wildcard" entitlement that should grant keychain_dumper access to all Keychain items that would have been granted had the tool been signed with each individual entitlement.  If you either don't trust this binary or are having trouble dumping Keychain items using the below steps, you may can build the tool from source and manually sign the appropriate entitlments into your build of the keychain_dumper binary.

As an aside, the following directions assume the target device has already been jailbroken.  

Upload keychain_dumper to a directory of your choice on the target device (I have used /tmp during testing).  Also, once uploaded, be sure to validate that keychain_dumper is executable (chmod +x ./keychain_dumper if it isn't) and validate that /private/var/Keychains/keychain-2.db is world readable (chmod +r /private/var/Keychains/keychain-2.db if it isn't).

If you are using the binary from Git you can attempt to dump all of the accessible password Keychain entries by simply running the tool with now flags

    ./keychain_dumper

Some keychain entries are available regardless of whether the iOS is locked or not, while other entries will only be accessible if the iOS device is unlocked (i.e. a user has entered their pin).  If no Keychain entries are displayed, or if you don't want to trust the provided binary, you may need to rerun the tool after building the application from source.  Please see the Build section below for details on how to build and sign the application.  

By default keychain_dumper only dumps "Generic" and "Internet" passwords.  This is generally what you are interested in, as most application passwords are stored as "Generic" or "Internet" passwords.  However, you can also pass optional flags to dump additional information from the Keychain.  If you run keychain_dumper with the `-h` option you will get the following usage string:

	Usage: keychain_dumper [-e]|[-h]|[-agnick]
	<no flags>: Dump Password Keychain Items (Generic Password, Internet Passwords)
	-a: Dump All Keychain Items (Generic Passwords, Internet Passwords, Identities, Certificates, and Keys)
	-e: Dump Entitlements
	-g: Dump Generic Passwords
	-n: Dump Internet Passwords
	-i: Dump Identities
	-c: Dump Certificates
	-k: Dump Keys

By default passing no option flags is equivalent to running keychain_dumper with the `-gn` flags set.  The other flags largely allow you to dump additional information related to certificates that are installed on the device.  

## Building

Build with Theos:

```bash
cd Keychain-Dumper
ln -s /opt/theos .
make
make ldid
```

## Contact & Help

If you find a bug you can [open an issue](http://github.com/ptoomey3/Keychain-Dumper/issues).
