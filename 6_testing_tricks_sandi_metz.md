
## Mastering Unit Tests with Sandi Metz’s “Magic Tricks of Testing”
### Making your tests _fast_, _stable_, and _joyful_ ❤️


See how our _Dog class_ + _dog_spec.rb_ aligns:

### Step 1 — Identify messages (method calls)

Our Dog class:

| Method       | Type             | Description                              |
| ------------ | ---------------- | ---------------------------------------- |
| `bark`       | Incoming Query   | Returns `'woof!'`                        |
| `feed`       | Incoming Command | Changes internal state (`@hunger_level`) |
| `hungry?`    | Incoming Query   | Returns true/false based on state        |
| `initialize` | Incoming Command | Sets internal state (`@hunger_level`)    |

### Step 2 — Apply Sandi Metz’s 6 magic tricks
| Message Type               | Public / Incoming | To Self | Outgoing | Test Approach             | Your Example                                               |
| -------------------------- | ----------------- | ------- | -------- | ------------------------- | ---------------------------------------------------------- |
| Incoming Query             | ✅                 | —       | —        | Assert return value       | `expect(subject.bark).to eql('woof!')`                     |
| Incoming Command           | ✅                 | —       | —        | Assert public side effect | `subject.feed; expect(subject).to_not be_hungry`           |
| Messages to Self           | —                 | 🚫      | —        | Ignore                    | `@hunger_level > 5` is private logic; tested via `hungry?` |
| Private Commands (to self) | —                 | 🚫      | —        | Ignore                    | None directly tested                                       |
| Outgoing Command           | —                 | —       | ✅        | Mock expectation          | Not applicable (no observer / other object involved)       |

#### Observations:

You don’t test private methods directly. You only test _hungry?_, _feed_, and _bark_ from the outside → exactly what Sandi recommends.

You assert return values for queries (_bark_, _hungry?_) → correct.

You assert state change for commands (_feed_) → correct.

No outgoing commands (interactions with other objects) → you’d use _mocks/stubs_ here if there were.

All tests are fast, simple, and focused on public behavior → aligns perfectly with “magic tricks” philosophy.

### Step 3 — Fill in the “final grid” for your example

| Type         | Query                                   | Command                     |
| ------------ | --------------------------------------- | --------------------------- |
| **Incoming** | `bark`, `hungry?` ✅ Assert return value | `feed` ✅ Assert side effect |
| **To Self**  | N/A 🚫 Ignore                           | N/A 🚫 Ignore               |
| **Outgoing** | N/A 🚫 Ignore                           | N/A 🚫 Ignore               |

### Step 4 — Extra notes / best practices

- You wrap tests in _describe_ and _context blocks_ → `keeps intent clear`.

- You use _subject { ... }_ when you need a specific state → `aligns with testing “only what matters.”`

- You _avoid_ testing _internal variables_ directly → `good`.

- If you later introduce interactions with other objects (_observers_, _database_, _etc._) → you would use `mocks/stubs`.

### Conclusion

Your current _Dog_ tests fully follow Sandi Metz’s rules:
```text
Test public messages only.

Query methods → assert return values.

Command methods → assert side effects.

Ignore private/internal methods.

Simple, stable, fast tests with clear intent.
```
### 🔹 Why this works:

_Resilient to change_ is more natural than _can tolerate change_.

_Should depend on_ or _couples only to_ makes the _cause-effect relationship_ clearer.

_Stable components/parts_ conveys the idea of _reliable abstractions_ that _rarely change_.

.

__References__: [Rails Conf 2013 The Magic Tricks](https://youtu.be/URSWYvyc42M?si=pLaJWUMi4Fzo96wB) of Testing by [Sandi Metz](https://www.linkedin.com/in/sandi-metz-0932a84b/)

----

.

> __Good tests aren’t magic. They’re magic tricks — and you can learn them.__  
>  ---
> Sandi Metz

.
