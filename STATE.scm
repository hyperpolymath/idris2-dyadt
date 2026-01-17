;; SPDX-License-Identifier: MPL-2.0
;; STATE.scm - Current project state for idris2-dyadt

(state
  (metadata
    (version "1.0.0")
    (schema-version "1.0")
    (created "2025-01-17")
    (updated "2025-01-17")
    (project "idris2-dyadt")
    (repo "https://github.com/hyperpolymath/idris2-dyadt"))

  (project-context
    (name "idris2-dyadt")
    (tagline "Compile-time verified claims using dependent types - the proven version of did-you-actually-do-that")
    (tech-stack
      (primary "Idris2")
      (version "0.8.0")
      (paradigm "dependently-typed functional")))

  (current-position
    (phase "initial-release")
    (overall-completion 80)
    (components
      (claim-types 95 "Claim data type with rich constructors")
      (evidence-types 90 "AllOf/AnyOf evidence combinators")
      (verdict-types 85 "Verified/Contested verdict types")
      (verifier 80 "Claim verification infrastructure")
      (combinators 85 "Claim combination utilities")
      (echidna-integration 90 "Integration with idris2-echidna")
      (cno-integration 90 "Integration with idris2-cno"))
    (working-features
      "Claims as dependent types"
      "Evidence as proof terms"
      "Compile-time claim verification"
      "AllOf/AnyOf evidence combinators"
      "Integration with echidna provers"
      "Integration with CNO identity proofs"))

  (route-to-mvp
    (milestone "v0.1.0 - Core Types" (status "complete"))
    (milestone "v0.2.0 - Integrations" (status "complete"))
    (milestone "v0.3.0 - Runtime Verification" (status "in-progress"))
    (milestone "v1.0.0 - Production Ready" (status "planned")))

  (blockers-and-issues
    (medium "Evidence module uses believe_me in some places")
    (low "More claim types could be added"))

  (critical-next-actions
    (immediate "Add more example claims")
    (this-week "Improve documentation")
    (this-month "Register with pack"))

  (session-history
    (snapshot "2025-01-17"
      (accomplishments
        "Initial scaffolding complete"
        "8 modules compile cleanly"
        "Cross-library integration working"
        "Pushed to GitHub"))))
