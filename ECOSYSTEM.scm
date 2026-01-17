;; SPDX-License-Identifier: MPL-2.0
;; ECOSYSTEM.scm - Ecosystem relationships for idris2-dyadt

(ecosystem
  (version "1.0.0")
  (name "idris2-dyadt")
  (type "library")
  (purpose "Compile-time verified claims using Idris2 dependent types")

  (position-in-ecosystem
    (role "integration-hub")
    (layer "verification-framework")
    (description "Provides claim/evidence types and integrates echidna + cno"))

  (related-projects
    (project "idris2-echidna"
      (relationship "dependency")
      (description "Provides theorem prover backends for claim verification"))

    (project "idris2-cno"
      (relationship "dependency")
      (description "Provides CNO identity proofs as dyadt evidence"))

    (project "did-you-actually-do-that"
      (relationship "inspiration")
      (description "Original runtime claim verification library"))

    (project "absolute-zero"
      (relationship "sibling-standard")
      (description "Formal verification methodology that dyadt implements")))

  (what-this-is
    "Compile-time verified claims"
    "Evidence as dependent type values"
    "Integration point for echidna and cno"
    "Type-safe claim verification framework")

  (what-this-is-not
    "Runtime-only verification"
    "A testing framework"
    "A replacement for formal proofs"
    "Guaranteed to verify all claims (some need external provers)"))
