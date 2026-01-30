;; SPDX-License-Identifier: PMPL-1.0-or-later
;; META.scm - Meta-level information for idris2-dyadt

(meta
  (architecture-decisions
    (adr-001
      (title "Claims as types, evidence as values")
      (status "accepted")
      (date "2025-01-17")
      (context "Need a way to express verifiable claims at the type level")
      (decision "Model claims as Idris2 types and evidence as values of those types")
      (consequences
        "Compile-time verification of claim satisfaction"
        "Cannot construct evidence without proof"
        "Dependent types required for full expressiveness"))

    (adr-002
      (title "AllOf/AnyOf instead of All/Any")
      (status "accepted")
      (date "2025-01-17")
      (context "Prelude exports All and Any which conflict with our types")
      (decision "Name our evidence combinators AllOf and AnyOf")
      (consequences
        "Avoids namespace conflicts"
        "Clear that these are dyadt-specific types"
        "Slightly longer names"))

    (adr-003
      (title "Integration via dependency, not circular")
      (status "accepted")
      (date "2025-01-17")
      (context "Need to integrate with echidna and cno without circular dependencies")
      (decision "dyadt depends on echidna and cno; they remain standalone")
      (consequences
        "Clean dependency graph"
        "dyadt is the integration point"
        "echidna and cno can be used independently")))

  (development-practices
    (code-style "Follow Idris2 community style guide")
    (security "No unsafe operations in core modules")
    (testing "Example-based testing with dependent types")
    (versioning "Semantic versioning")
    (documentation "Module-level doc comments with examples")
    (branching "main for stable, feature/* for development"))

  (design-rationale
    (why-claims-as-types "Types are checked at compile time, catching errors early")
    (why-evidence-as-values "Values must be constructed, proving claims are satisfied")
    (why-integrate-echidna "External provers can verify complex claims")
    (why-integrate-cno "CNOs provide identity proofs that become dyadt evidence")))
