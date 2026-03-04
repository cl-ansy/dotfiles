Perform a performance audit of: $ARGUMENTS

If no target is given, audit the whole codebase.

Check for:

### Unnecessary Work
- Logic running more often than needed (inside loops, on every render/request)
- Redundant computations that could be cached or memoized
- Fetching more data than needed (over-fetching, missing pagination)

### Async & Concurrency
- Sequential `await` calls that could run in parallel with `Promise.all`
- Blocking operations on the main thread / event loop
- Missing debounce/throttle on high-frequency events

### Memory
- Objects or closures accumulating without being released
- Large data structures held in memory longer than needed
- Event listeners or subscriptions not cleaned up

### Network
- Waterfalls — requests that could be parallelized or batched
- Missing caching (HTTP cache headers, in-memory cache, memoization)
- Payload size — sending more than the client needs

### TypeScript-Specific
- Expensive type computations (deep mapped types on hot paths)
- Unnecessary re-renders caused by object/array literals in JSX props or hook deps

Format findings by impact: **High → Medium → Low**

For each: what it is, where it is (file:line), estimated impact, and how to fix it. Flag any findings that need profiling data to confirm — don't assume impact without evidence.
