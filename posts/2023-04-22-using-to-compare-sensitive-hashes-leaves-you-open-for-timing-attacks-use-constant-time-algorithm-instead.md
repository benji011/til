---
title: "Using `==` to compare sensitive hashes leaves you open for timing attacks, use constant-time algorithm instead"
date: 2023-04-22T00:00:00Z
tags: [security, python]
---

When comparing sensitive values like password hashes or authentication tokens, using standard string comparison (`==`) creates a security vulnerability. The comparison returns as soon as it finds a mismatch, and attackers can measure these tiny timing differences to gradually deduce the correct value.

**The problem:**

```python
# Vulnerable to timing attacks
if user_hash == stored_hash:
    authenticate()
```

If the first character doesn't match, the comparison exits immediately. If it matches, it continues to the second character. An attacker can measure response times to determine which characters are correct.

**The solution:**

Use a constant-time comparison that always checks every character, regardless of whether a mismatch is found:

```python
import hmac

# Secure constant-time comparison
if hmac.compare_digest(user_hash, stored_hash):
    authenticate()
```

Python's `hmac.compare_digest()` takes the same amount of time whether the strings match or not, preventing attackers from using timing analysis to extract the secret value byte by byte.

This is critical for comparing any security-sensitive values: password hashes, HMAC signatures, API tokens, or session identifiers.

[Original source](https://codahale.com/a-lesson-in-timing-attacks/)
