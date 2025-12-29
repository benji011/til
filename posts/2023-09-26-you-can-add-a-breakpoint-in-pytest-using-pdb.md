---
title: "You can add a breakpoint in pytest using `--pdb`"
date: 2023-09-26T00:00:00Z
tags: [python, testing]
---

When debugging failing tests, pytest has built-in support for dropping into Python's debugger (pdb) automatically when a test fails or at specific breakpoints.

**Run pytest with the `--pdb` flag:**

```bash
pytest --pdb
```

This will pause execution and open an interactive pdb session whenever a test fails, allowing you to inspect variables, step through code, and understand what went wrong.

**For manual breakpoints**, add this to your test code:

```python
def test_something():
    result = complex_calculation()
    breakpoint()  # Drops into pdb here
    assert result == expected
```

**Useful pdb commands:**
- `l` (list) - Show surrounding code
- `p variable_name` - Print a variable's value
- `n` (next) - Execute the next line
- `c` (continue) - Continue execution
- `q` (quit) - Exit the debugger

This is especially helpful when trying to understand why a test is failing or to explore the state of your application during test execution.

[Original source](https://www.oreilly.com/library/view/python-testing-with/9781680509427/f_0150.xhtml)
