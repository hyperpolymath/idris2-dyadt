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
    (phase "v0.1.0-released")
    (overall-completion 90)
    (components
      (claim-types 98 "Claim data type with rich constructors")
      (evidence-types 95 "AllOf/AnyOf evidence combinators")
      (verdict-types 90 "Verified/Contested verdict types")
      (verifier 85 "Claim verification infrastructure")
      (combinators 90 "Claim combination utilities")
      (echidna-integration 95 "Integration with idris2-echidna")
      (cno-integration 95 "Integration with idris2-cno")
      (examples 95 "Comprehensive claim verification examples")
      (tests 95 "TestClaims.idr with compile-time proofs")
      (documentation 95 "README with API reference, pack.toml"))
    (working-features
      "Claims as dependent types"
      "Evidence as proof terms"
      "Compile-time claim verification"
      "AllOf/AnyOf evidence combinators"
      "Integration with echidna provers"
      "Integration with CNO identity proofs"
      "Deployment pipeline examples"
      "Pack package manager support"))

  (route-to-mvp
    (milestone "v0.1.0 - Core Types" (status "complete"))
    (milestone "v0.2.0 - Integrations" (status "complete"))
    (milestone "v0.3.0 - Runtime Verification" (status "in-progress")
      (items
        "Dynamic claim verification"
        "External evidence loading"
        "Hybrid compile/runtime verification"))
    (milestone "v1.0.0 - Production Ready" (status "planned")))

  (blockers-and-issues
    (medium "Evidence module uses believe_me in some places")
    (low "More claim types could be added"))

  (critical-next-actions
    (immediate "Add fuzzing tests")
    (this-week "Implement runtime verification fallback")
    (this-month "Submit to pack-db"))

  (session-history
    (snapshot "2025-01-17T12:00"
      (accomplishments
        "Initial scaffolding complete"
        "8 modules compile cleanly"
        "Cross-library integration working"
        "Pushed to GitHub"))
    (snapshot "2025-01-17T18:00"
      (accomplishments
        "Added TestClaims.idr with evidence construction tests"
        "Created Examples.idr with deployment pipeline patterns"
        "Added pack.toml with dependency specifications"
        "Expanded README with installation and API docs"
        "Added security workflows (CodeQL, Scorecard)"
        "Enabled branch protection"
        "Set up mirror workflows for GitLab/Bitbucket"))
    (snapshot "2025-01-17T20:00"
      (accomplishments
        "Added ROADMAP.md with milestone tracking"
        "Updated README status badge to v0.1.0"
        "Final documentation review complete"
        "All SCM checkpoint files updated"))))
