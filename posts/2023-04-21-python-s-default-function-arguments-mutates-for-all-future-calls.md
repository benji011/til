---
title: "Python's default function arguments mutates for all future calls"
date: 2023-04-21T00:00:00Z
tags: [python]
---

When you use a mutable object (like a list or dictionary) as a default argument in a Python function, it's created once when the function is defined, not each time the function is called. This means modifications persist across all future calls.

Here's the problem:

```python
def append_to(element, to=[]):
    to.append(element)
    return to

my_list = append_to(12)
print(my_list)  # [12]

my_other_list = append_to(42)
print(my_other_list)  # [12, 42] — unexpected!
```

The second call returns `[12, 42]` because both calls share the same default list object.

**The solution**: Use `None` as the default and create a new object inside the function:

```python
def append_to(element, to=None):
    if to is None:
        to = []
    to.append(element)
    return to

my_list = append_to(12)
print(my_list)  # [12]

my_other_list = append_to(42)
print(my_other_list)  # [42]
```

This ensures each call gets its own independent list.

[Original source](https://docs.python-guide.org/writing/gotchas/#mutable-default-arguments)
