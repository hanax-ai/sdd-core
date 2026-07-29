> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Quickstart: Synthetic Message-of-the-Day Library (Phase 1)

End-to-end walkthrough verified by `tests/integration/test_quickstart.py` (SC-003):

```python
from motd.api import get_message, get_message_today
from datetime import date

# 1. Deterministic message for an explicit (month, day) (FR-001)
assert get_message(1, 1) == get_message(1, 1)

# 2. Current-day path: the APPLICATION injects its clock; end users pass nothing (FR-002)
class FixedClock:
    def today(self):
        return date(2026, 3, 1)

assert get_message_today(FixedClock()) == get_message(3, 1)
```

Invalid month/day pairs raise a descriptive `ValueError` (FR-003). That is the entire public surface.
