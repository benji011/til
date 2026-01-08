---
title: "How to share your wifi password on MacOS with the security command"
date: 2026-01-08T00:00:00Z
tags: []
---

On MacOS there is a utility command called `security` that can retrieve passwords stored in the Keychain. The command in question works like this:

```
security find-generic-password -wa <your-wifi-name>
```

You combine it with `find-generic-password` to search for a generic password entry in your keychain. The latter `-wa` means to print only the password and the account name (and nothing else like metadata).

The suffix is of course your wifi service name. Note that this only works if you've connected to that service before.

This is useful if you want to share that password with somebody else.
