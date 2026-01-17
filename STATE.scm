; SPDX-License-Identifier: MPL-2.0
; STATE.scm - Project state tracking

(state
  (metadata
    (version "0.1.0")
    (schema-version "1.0")
    (created "2025-01-17")
    (updated "2025-01-17")
    (project "idris2-dyadt")
    (repo "https://github.com/hyperpolymath/idris2-dyadt"))

  (project-context
    (name "idris2-dyadt")
    (tagline "Compile-time verified claims using dependent types")
    (tech-stack ("Idris2" "Dependent Types")))

  (current-position
    (phase "scaffolding-complete")
    (overall-completion 50)
    (components
      (claim-types 85)
      (evidence-types 80)
      (verdict-types 75)
      (verifier 50)
      (combinators 85)
      (echidna-integration 75)
      (cno-integration 75)
      (documentation 60))
    (working-features
      "Claim type hierarchy (FileExists, FileWithHash, GitClean, etc.)"
      "Evidence as dependent type family"
      "Verified wrapper type"
      "Combinator DSL (file, dir, cmd, gitClean, all, any, and, or)"
      "Runtime fallback verifier"
      "Echidna theorem prover integration"
      "CNO property claims"
      "Common patterns (rustProject, nodeProject, ciEnvironment)"
      "Example workflows"))

  (route-to-mvp
    (milestone "M1: Type System" (status "in-progress")
      (items
        (item "Finalize Claim constructors" (status "complete"))
        (item "Complete Evidence family" (status "complete"))
        (item "Test type-level computation" (status "pending"))))
    (milestone "M2: Elaboration" (status "pending")
      (items
        (item "Implement compile-time file checks" (status "pending"))
        (item "Implement compile-time command execution" (status "pending"))
        (item "Add elaboration reflection" (status "pending"))))
    (milestone "M3: Integration" (status "complete")
      (items
        (item "Integrate with idris2-echidna" (status "complete"))
        (item "Integrate with idris2-cno" (status "complete"))
        (item "Documentation and examples" (status "complete"))))
    (milestone "M4: Production Ready" (status "pending")
      (items
        (item "Full test suite" (status "pending"))
        (item "Elaboration-based verification" (status "pending"))
        (item "CI/CD pipeline" (status "pending")))))

  (blockers-and-issues
    (critical ())
    (high
      (issue "Need elaboration scripts for compile-time checks"
        (workaround "Using runtime verifier fallback"))
      (issue "Some claim types not fully verified at compile time"
        (workaround "believe_me placeholders where needed")))
    (medium
      (issue "Runtime verifier needs more claim types"
        (workaround "Core types implemented, others pending"))
      (issue "JSON path verification not implemented"
        (workaround "Deferred to future milestone"))))

  (critical-next-actions
    (immediate
      "Test claim type hierarchy compiles"
      "Add unit tests for evidence constructors"
      "Verify combinator composition")
    (this-week
      "Start elaboration script research"
      "Add more evidence convenience functions"
      "Document integration patterns")
    (this-month
      "Implement elaboration-based file verification"
      "Add compile-time git status checks"
      "Performance testing"))

  (session-history
    (session "2025-01-17-scaffold"
      (accomplishments
        "Created initial project structure"
        "Implemented Claim type hierarchy"
        "Created Evidence dependent type family"
        "Added Verified wrapper and Verifier"
        "Built Combinator DSL"
        "Added echidna and cno integrations"
        "Created example workflows"))))
