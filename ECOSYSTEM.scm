; SPDX-License-Identifier: MPL-2.0
; ECOSYSTEM.scm - Project ecosystem positioning

(ecosystem
  (version "1.0")
  (name "idris2-dyadt")
  (type "library")
  (purpose "Compile-time verified claims using Idris2 dependent types")

  (position-in-ecosystem
    "The compile-time counterpart to did-you-actually-do-that"
    "Encodes verification in the type system rather than runtime"
    "Central claims library for the hyperpolymath Idris2 verification stack"
    "Provides the Claim → Evidence → Verified pattern as types")

  (ecosystem-diagram
    "
    ┌─────────────────────────────────────────────────────────────┐
    │                    User Applications                         │
    └─────────────────────────────────────────────────────────────┘
                                 │
                                 ▼
                          ┌─────────────┐
                          │ idris2-dyadt │
                          │  (claims)    │
                          └─────────────┘
                           │           │
              ┌────────────┘           └────────────┐
              ▼                                     ▼
       ┌─────────────┐                       ┌─────────┐
       │ idris2-     │                       │idris2-  │
       │ echidna     │                       │  cno    │
       │ (provers)   │                       │(CNOs)   │
       └─────────────┘                       └─────────┘
              │
              ▼
       ┌─────────────┐
       │  ECHIDNA    │
       │   (Rust)    │
       └─────────────┘
    ")

  (related-projects
    (did-you-actually-do-that
      (relationship "runtime-counterpart")
      (integration "Same claim patterns, different verification time")
      (description "The Rust runtime verification library this is based on"))
    (idris2-echidna
      (relationship "verification-backend")
      (integration "Dyadt.Integration.Echidna module")
      (description "Theorem prover bindings for formal proofs"))
    (idris2-cno
      (relationship "downstream-consumer")
      (integration "Dyadt.Integration.CNO module")
      (description "CNO proofs that use verified claims"))
    (llm-verify
      (relationship "ecosystem-sibling")
      (integration "Same conceptual model")
      (description "Haskell LLM verification using same concepts"))
    (absolute-zero
      (relationship "theoretical-foundation")
      (integration "CNO theory formalization")
      (description "Formal verification theory this builds on")))

  (integration-points
    (provides
      "Claim type hierarchy for expressing what to verify"
      "Evidence type family for proofs"
      "Verified wrapper for verified claims"
      "Combinator DSL for building complex claims"
      "Runtime fallback verifier")
    (consumes
      "Echidna for theorem-proved claims"
      "CNO library for CNO-related claims"))

  (what-this-is
    "Claims encoded as types (FileExists, GitClean, etc.)"
    "Evidence as dependent type family indexed by claims"
    "Compile-time verification via type checking"
    "DSL for building complex claims (and, or, all, any)"
    "Runtime fallback for dynamic verification"
    "Integration layer with echidna and cno")

  (what-this-is-not
    "Not a runtime verification library (use did-you-actually-do-that)"
    "Not a theorem prover (use echidna)"
    "Not a general proof assistant"
    "Not CNO-specific (use idris2-cno)"))
