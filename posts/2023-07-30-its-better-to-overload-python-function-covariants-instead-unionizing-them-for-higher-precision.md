---
title: "Its better to overload python function covariants instead Unionizing them for higher precision"
date: 2023-07-30T00:00:00Z
tags: [python, typing]
---

When a function can accept different types and returns different types based on the input, using `@overload` provides more precise type hints than using `Union` types. This helps type checkers like mypy understand the exact return type for each input type.

**The problem with Union:**

```python
from typing import Union

def process(x: Union[int, str]) -> Union[int, str]:
    if isinstance(x, int):
        return x * 2
    return x.upper()

# Type checker can't determine the precise return type
result = process(5)  # Could be int or str, mypy doesn't know which
```

**The solution with @overload:**

```python
from typing import overload

@overload
def process(x: int) -> int: ...

@overload
def process(x: str) -> str: ...

def process(x):
    if isinstance(x, int):
        return x * 2
    return x.upper()

result = process(5)  # Type checker knows this is int
text = process("hello")  # Type checker knows this is str
```

With `@overload`, type checkers can provide accurate autocompletion and catch type errors that would slip through with Union types. Each overload signature precisely describes one specific input-output relationship.

[Original source](https://medium.com/analytics-vidhya/making-sense-of-typing-overload-437e6deecade)
