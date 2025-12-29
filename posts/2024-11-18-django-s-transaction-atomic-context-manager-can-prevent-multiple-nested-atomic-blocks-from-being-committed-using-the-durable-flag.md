---
title: "Django's transaction.atomic context manager can prevent multiple/nested atomic blocks from being committed using the durable flag"
date: 2024-11-18T00:00:00Z
tags: [django, python, database]
---

Django's `atomic()` context manager can ensure a transaction block is always the outermost transaction using the `durable=True` flag. This prevents accidental nesting and guarantees database changes are actually committed to disk.

**The problem:**

Normally, nested `atomic()` blocks create savepoints rather than full transactions:

```python
@transaction.atomic
def outer_function():
    # This is a transaction
    with transaction.atomic():
        # This is just a savepoint, not a new transaction
        User.objects.create(name="John")
```

**The solution with `durable=True`:**

```python
from django.db import transaction

# This ensures the block is never nested
@transaction.atomic(durable=True)
def create_user(request):
    user = User.objects.create(name="John")
    return user

# This raises RuntimeError - can't nest durable block
@transaction.atomic
def process_request(request):
    with transaction.atomic(durable=True):  # ❌ RuntimeError!
        create_user(request)
```

**When to use it:**

The `durable` flag is useful when you need to guarantee:

- Database changes are actually committed to disk (not deferred as part of a larger transaction)
- You want to prevent accidental nesting that could undermine durability guarantees
- You're implementing critical operations that must be fully committed before proceeding (e.g., financial transactions, audit logs)

If a durable block is nested, Django immediately raises a `RuntimeError`, making it clear that the code structure violates your durability requirements.

[Original source](https://docs.djangoproject.com/en/dev/topics/db/transactions/#controlling-transactions-explicitly)
