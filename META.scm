; SPDX-License-Identifier: MPL-2.0
; META.scm - Project metadata and architectural decisions

(meta
  (version "1.0")
  (project "idris2-dyadt")

  (architecture-decisions
    (adr-001
      (status "accepted")
      (date "2025-01-17")
      (title "Claims as data types, not GADTs")
      (context "Need to represent claims at both type and value level")
      (decision "Use a simple data type for Claim, with Evidence as GADT indexed by Claim")
      (consequences
        "Claims can be manipulated as values (combinators)"
        "Evidence proves specific claims at type level"
        "Show instance possible for claims"))

    (adr-002
      (status "accepted")
      (date "2025-01-17")
      (title "Evidence as dependent type family")
      (context "Evidence must be tied to specific claims")
      (decision "Define Evidence : Claim -> Type with constructors for each claim type")
      (consequences
        "Type-safe evidence construction"
        "Impossible to provide wrong evidence for a claim"
        "Combinators compose evidence correctly"))

    (adr-003
      (status "accepted")
      (date "2025-01-17")
      (title "Runtime verifier fallback")
      (context "Some claims cannot be verified at compile time")
      (decision "Provide runtime verifier that returns VerificationResult")
      (consequences
        "Gradual adoption - can start with runtime, migrate to compile-time"
        "Dynamic claims still supported"
        "Clear distinction between compile-time and runtime verification"))

    (adr-004
      (status "accepted")
      (date "2025-01-17")
      (title "Combinator DSL for claim construction")
      (context "Users need to build complex claims from simple ones")
      (decision "Provide combinator functions (file, dir, cmd, and, or, all, any)")
      (consequences
        "Familiar fluent API from did-you-actually-do-that"
        "Easy to build complex claims"
        "Infix operators for readability"))

    (adr-005
      (status "accepted")
      (date "2025-01-17")
      (title "Integration modules for ecosystem")
      (context "Need to work with echidna and cno")
      (decision "Create Integration.Echidna and Integration.CNO modules")
      (consequences
        "Clean separation of concerns"
        "Optional dependencies"
        "Easy to extend for future libraries")))

  (development-practices
    (code-style
      "Follow Idris2 standard naming conventions"
      "Use total functions where possible (%default total)"
      "Public exports explicit with 'public export'"
      "Document all public functions with ||| comments")
    (security
      "Runtime verifier validates inputs"
      "File operations sandboxed"
      "Command execution requires explicit claim")
    (testing
      "Type-checking as primary test"
      "Runtime verifier has unit tests"
      "Integration tests with echidna")
    (versioning "Semantic versioning (SemVer)")
    (documentation
      "README.adoc with quick start"
      "Doc comments on all public APIs"
      "Examples directory with working code")
    (branching
      "main is stable"
      "feature/* for new features"
      "fix/* for bug fixes"))

  (design-rationale
    (why-dependent-types
      "Encode proof obligations in types"
      "Compile-time verification"
      "Stronger guarantees than runtime")
    (why-mirror-rust-api
      "Familiar API for did-you-actually-do-that users"
      "Conceptual consistency across languages"
      "Easy migration path")
    (why-combinators
      "Build complex claims from simple ones"
      "Composable and testable"
      "Matches functional programming style")
    (why-runtime-fallback
      "Not everything can be checked at compile time"
      "Gradual adoption"
      "Dynamic configurations")))
