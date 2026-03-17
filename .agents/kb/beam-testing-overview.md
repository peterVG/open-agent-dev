
# 1. Foundational Testing Philosophy: The BEAM Paradigm

As a Senior BEAM Architect, one must understand that the Erlang Runtime System (ERTS) does not treat failure as an exceptional state, but as a predictable event. Our testing strategies must shift from defensive error-catching to validating system resilience.

## Process Isolation and "Let it Crash"
The Actor model ensures that every process has its own isolated memory and heap. A failure in one process cannot corrupt the state of another. Consequently, "Fault Tolerance" is not the absence of errors, but the ability to recover from them. We do not test to prevent the crash; we test to ensure the Supervision Tree responds correctly.

**Testing the Crash:** Logic testing is insufficient for high-availability systems. We must perform resilience testing by manually terminating processes using `Process.exit(pid, :kill)` and asserting that the supervisor restores the process to a known-stable state. A robust test suite validates that the system maintains integrity across restarts.

## Core BEAM Virtues
Testing must validate the four pillars of the BEAM:
*   **Concurrency:** Validating the lifecycle of millions of lightweight processes.
*   **Distribution:** Testing "Location Transparency," where processes interact identically whether local or on a remote node.
*   **Responsiveness:** Ensuring preemptive scheduling remains fluid under load.
*   **Fault Tolerance:** Automated recovery through hierarchical supervision.

# 2. Unit Testing with ExUnit and EUnit
Unit testing in Elixir (ExUnit) and Erlang (EUnit) focuses on functional purity. Because functions in the BEAM are typically side-effect-free, we prioritize testing the "Happy Path" and delegate recovery to the runtime.

## The Boolean and Db Examples
Testing a functional "Database" based on list manipulation is a prerequisite for understanding stateful process testing.

**Elixir (ExUnit)**
```elixir
# Boolean Logic Test
defmodule BooleanTest do
  use ExUnit.Case
  
  test "negation and and" do
    assert Boolean.b_not(false)
    refute Boolean.b_not(true)
    assert Boolean.b_and(true, true)
    refute Boolean.b_and(true, false)
  end
end

# List-based Db Test (Slide 41/42)
defmodule DbTest do
  use ExUnit.Case

  test "db operations" do
    db = Db.new()
    db = Db.write(db, :key, "value")
    assert {:ok, "value"} == Db.read(db, :key)
    db = Db.delete(db, :key)
    assert {:error, :not_found} == Db.read(db, :key)
  end
end
```

**Erlang (EUnit)**
```erlang
-module(db_tests).
-include_lib("eunit/include/eunit.hrl").

db_test() ->
    Db = db:new(),
    Db1 = db:write(Db, key, value),
    ?assertMatch({ok, value}, db:read(Db1, key)),
    Db2 = db:delete(Db1, key),
    ?assertNot(db:read(Db2, key) =:= {ok, value}). %% Use ?assertNot for refutation
```

# 3. Property-Based Testing (PBT): PropEr and PropCheck
Traditional unit tests are limited by the developer's imagination. PBT uses generators to explore the entire input space, finding edge cases through automated "shrinking" of failures.

## The Oracle Pattern: CreateProps
In the `CreateProps` example, we use a known-good function (the "Oracle") from the standard library to validate our custom implementation.

```elixir
defmodule CreateProps do
  use ExUnit.Case
  use PropCheck

  property "List creation matches Enum oracle" do
    forall i <- positive_integer() do
      # Validate custom create/1 against trusted Enum.to_list/1
      Create.create(i + 1) == Enum.to_list(1..i+1)
    end
  end

  property "Reverse list creation matches lists:reverse oracle" do
    forall i <- positive_integer() do
      Create.reverse_create(i + 1) == Enum.reverse(Enum.to_list(1..i+1))
    end
  end
end
```

## Technical Directive for PBT Implementation
1.  **Identify Invariants:** Define what must always be true (e.g., `reverse(reverse(L)) == L`).
2.  **Define Generators:** Use `positive_integer()`, `list()`, or `binary()` to scope the input.
3.  **Execute via forall:** Wrap the assertion in the `forall` macro to run the property hundreds of times.

# 4. Mocking Behaviours and Dependencies with Mox
In a concurrent ecosystem, global mocking is a hazard. `Mox` solves this by enforcing Behaviours and scoped mocking.

## Technical Requirement: Defining Callbacks
Before mocking, you must define an Elixir `@callback`. This ensures "Type-Safe Mocking," where the mock is guaranteed to adhere to the module's contract.

## Comparison: Mox Functions
| Feature | Mox.stub/2 | Mox.expect/4 |
| :--- | :--- | :--- |
| **Primary Intent** | Default generic responses (Stubs). | Verifying side effects (Mocks). |
| **Invocation** | Can be called zero or many times. | Must be called N times or the test fails. |
| **Verification** | Implicit success if never called. | Strict verification of specific calls. |

## The Necessity of :verify_on_exit!
Because BEAM tests are inherently concurrent, the test process and the process being tested often run asynchronously. We use `:verify_on_exit!` in the setup block to ensure that all expectations are checked even if the test process finishes before the mocked call completes in a linked process.

# 5. System and Component Testing for Phoenix and LiveView
Modern Phoenix applications require testing real-time, stateful interactivity without the overhead of a full browser when possible. To achieve this, we enforce a strict **Three-Tier UI Testing Hierarchy**:

## 1. Level 1: Core Logic (ExUnit)
Testing context boundaries and business logic completely decoupled from any UI rendering.

## 2. Level 2: Component Isolation (LiveIsolatedComponent)
This library allows for the isolation of LiveView components. A key architect-level strategy is testing `handle_event` and `handle_info` by passing anonymous functions as callbacks. This permits rapid verification of localized state transitions and UI updates.

```elixir
# Intercepting events in an isolated component test
live_isolated_component(MyComponent, 
  handle_event: fn _event, _params, socket ->
    # Assert on state changes here
    {:noreply, assign(socket, :notified, true)}
  end
)
```

## 3. Level 3: Browser End-to-End & BDD (Wallaby)
For full browser End-to-End (E2E) testing bridging multiple pages or validating JavaScript hooks alongside LiveView, **Wallaby** provides the industry standard for managing concurrent browser sessions that interact with the BEAM's WebSocket-based channels. (See the TL;DR section above for the strict `Wallaby.Feature` BDD standard).

# 6. Testing Concurrency, Distribution, and State

## Stateful Processes and the Pin Operator
When testing asynchronous message passing (e.g., in a DbProcess or GenServer), we must avoid race conditions. We use the pin operator (`^`) in `receive` blocks to match against a specific reference.

```elixir
def test_async_read(dbref) do
  send(dbref, {:read, :key, self()})
  # Use ^dbref to ensure we only match the response from THIS specific request
  assert_receive {^dbref, {:ok, "value"}}
end
```
Without the pin operator, a test might match a "ghost" message from a previous failed run, leading to flaky suites.

## Distribution Testing
Testing distribution requires validating that process location is transparent. Architects should use `net_adm:ping(Node)` to verify connectivity and `Node.spawn/2` to execute logic across a "local cluster." This ensures that the application behaves correctly when the GenServer state is stored on a remote node.

# 7. Resilience and Performance Instrumentation

## Reductions and the "Hot Path"
In the BEAM, the unit of work is a Reduction. Discord’s case study revealed that high reduction counts in a single "Guild" GenServer caused latency spikes of up to 2.1 seconds. Testing must identify these "Hot Paths" where process de-scheduling leads to queue backups.

## Architectural Scaling Solutions
*   **FastGlobal:** In high-read scenarios (e.g., routing tables), lookups in ETS take ~7μs due to data copying. FastGlobal exploits the shared heap to reduce this to 0.3μs.
*   **Manifold:** To avoid the high reduction cost of fanning out messages to thousands of PIDs, Manifold distributes the "send" work to remote nodes, fanning out locally to save network bandwidth.
*   **Semaphore:** Protects infrastructure during "stampede" scenarios (e.g., 5 million concurrent users reconnecting) by using atomic ETS counters to bail early if service failure is inevitable.

# 8. Tooling and Environment Configuration

## Library Recommendation Matrix

| Category | Elixir Tool | Erlang Tool |
| :--- | :--- | :--- |
| **Unit** | ExUnit | EUnit |
| **Property-Based** | PropCheck | PropEr |
| **Mocking** | Mox | N/A |
| **BDD/Feature** | Wallaby.Feature | Common Test (ct) |
| **Integration/Dist** | ExUnit | Common Test (ct) |
| **System/E2E** | Wallaby | Common Test (ct) |

## Production-Ready Testing Checklist
*   [ ] **Supervision Integrity:** Manually kill processes to verify restart strategies.
*   [ ] **Hot Code Reloading:** Validate that system updates can occur without dropping active connections (e.g., Klarna zero-downtime updates).
*   [ ] **Ghost Message Mitigation:** Verify the use of the pin operator (`^`) in all async receive blocks.
*   [ ] **Reduction Benchmarking:** Profile "Hot Path" GenServers for reduction costs and mailbox congestion.
*   [ ] **Infrastructure Protection:** Implement Semaphore patterns on all external 3rd-party API calls.
*   [ ] **Live Monitoring:** Use Observer during load tests to monitor memory fragmentation and scheduler utilization.
