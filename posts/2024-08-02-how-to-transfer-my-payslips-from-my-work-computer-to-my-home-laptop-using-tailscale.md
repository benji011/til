---
title: "How to transfer my payslips from my work computer to my home laptop using Tailscale"
date: 2024-08-02T00:00:00Z
tags: [tailscale, networking]
---

Tailscale creates a secure, private network between your devices, making it easy to transfer files between your work and home computers without relying on email, USB drives, or cloud storage.

**Setup:**

1. **Install Tailscale** on both computers from [tailscale.com](https://tailscale.com/)
2. **Sign in** with the same account on both devices
3. **Verify connection**: Both devices will appear in your Tailscale network

**Transfer files:**

Once connected, your devices can communicate directly:

```bash
# From work computer, copy to home laptop
scp payslip.pdf username@home-laptop:~/Documents/

# Or use file sharing
# Enable file sharing in Tailscale settings
# Then access via network browser
```

**Why use Tailscale:**

- **Secure**: Encrypted end-to-end connection using WireGuard
- **No port forwarding**: Works through firewalls and NAT
- **Simple**: No VPN server to configure
- **Cross-platform**: Works on Windows, Mac, Linux, iOS, Android
- **Private**: Files transfer directly between your devices, not through third parties

**Alternative approaches:**

- Use Tailscale's built-in file sharing feature (Taildrop)
- Set up SMB/Samba file sharing between machines
- Run an HTTP file server on one machine and access from the other

This is particularly useful for accessing documents, connecting to your home dev environment from work, or securely transferring sensitive files without putting them in cloud storage.

[Original source](https://tailscale.com/)
