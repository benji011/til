---
title: "The `requests` library supports automatic retries with exponential backoff "
date: 2024-12-06T00:00:00Z
tags: [python, requests, http]
---

The Python `requests` library can automatically retry failed HTTP requests with exponential backoff using urllib3's `Retry` class and a custom adapter.

**Implementation:**

```python
import requests
from requests.adapters import HTTPAdapter
from urllib3.util import Retry

# Configure retry strategy
retries = Retry(
    total=3,                              # Max retry attempts
    backoff_factor=3,                     # Wait time multiplier
    status_forcelist=[500, 502, 503, 504] # Retry on these status codes
)

# Create adapter with retry configuration
adapter = HTTPAdapter(max_retries=retries)

# Apply to session
session = requests.Session()
session.mount('https://', adapter)
session.mount('http://', adapter)

# Make requests through the session
response = session.get("https://api.example.com/endpoint")
```

**How exponential backoff works:**

With `backoff_factor=3`, the wait time between retries increases exponentially:
- 1st retry: wait 3 seconds
- 2nd retry: wait 6 seconds
- 3rd retry: wait 12 seconds

**Key parameters:**

- `total`: Maximum number of retry attempts
- `backoff_factor`: Multiplier for calculating wait time
- `status_forcelist`: HTTP status codes triggering retries (typically 500-level server errors)

**Use cases:**

- Handling temporary server outages
- Working with rate-limited APIs
- Improving reliability for flaky network conditions
- Dealing with overloaded services that return 503

The session will automatically retry failed requests without additional code, making your HTTP clients more resilient to transient failures.

[Original source](https://dev.to/benji011/til-that-the-requests-library-supports-automatic-retries-with-exponential-backoff-2b6d)
