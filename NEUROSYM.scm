;; SPDX-License-Identifier: MPL-2.0
;; NEUROSYM.scm - Symbolic semantics for idris2-dyadt

(define-module (idris2-dyadt neurosym)
  #:export (operation-definitions proof-obligations composition-rules))

(define operation-definitions
  '((claim-construct
     (forward-semantics . "Create a Claim type representing an assertion")
     (inverse . #f)
     (claim-type . "verified")
     (entropy-contribution . 0)
     (idris-type . "Claim")
     (examples . ("FileExists path" "GitClean repo" "EnvVarSet name")))

    (evidence-construct
     (forward-semantics . "Create evidence for a specific claim")
     (inverse . #f)
     (claim-type . "verified")
     (entropy-contribution . 2)
     (idris-type . "Evidence claim")
     (constraint . "Evidence type indexed by the claim it supports"))

    (verify
     (forward-semantics . "Combine evidence to produce Verified claim")
     (inverse . #f)
     (claim-type . "verified")
     (entropy-contribution . 0)
     (idris-type . "Evidence claim -> Verified claim"))

    (verify-all
     (forward-semantics . "Verify multiple claims with AllOf evidence")
     (inverse . #f)
     (claim-type . "verified")
     (entropy-contribution . 0)
     (idris-type . "AllOf Evidence claims -> Verified (AllClaims claims)"))

    (verify-runtime
     (forward-semantics . "Check claim at runtime via IO")
     (inverse . #f)
     (claim-type . "unverified")
     (entropy-contribution . 15)
     (idris-type . "Claim -> IO (Either RefutedClaim (Verified claim))")
     (note . "Runtime result is unverified until confirmed"))))

(define proof-obligations
  '((evidence-matches-claim
     (description . "Evidence type must be indexed by the claim it proves")
     (verification-method . "dependent-type-indexing")
     (failure-action . "type-error-at-compile-time")
     (idris-encoding . "Evidence : Claim -> Type"))

    (all-evidence-complete
     (description . "AllOf evidence must have evidence for every claim in list")
     (verification-method . "type-level-list-traversal")
     (failure-action . "incomplete-evidence-error"))

    (echidna-integration
     (description . "Claims routed to echidna must have valid theorem encoding")
     (verification-method . "encodeAsTheorem-validity")
     (failure-action . "downgrade-to-unverified"))

    (cno-integration
     (description . "CNO evidence must prove operation is identity")
     (verification-method . "CNO-proof-term")
     (failure-action . "reject-invalid-cno-claim"))))

(define composition-rules
  '((and-composition
     (rule . "both-required")
     (semantics . "Evidence (And a b) requires evidence for both a and b")
     (idris-type . "BothEvidence : Evidence a -> Evidence b -> Evidence (And a b)"))
    (or-composition
     (rule . "either-sufficient")
     (semantics . "Evidence (Or a b) requires evidence for either a or b")
     (idris-type . "LeftEvidence : Evidence a -> Evidence (Or a b)"))
    (all-composition
     (rule . "all-required")
     (semantics . "AllOf Evidence claims requires evidence for every claim")
     (idris-type . "AllCons : Evidence c -> AllOf Evidence cs -> AllOf Evidence (c :: cs)"))
    (any-composition
     (rule . "any-sufficient")
     (semantics . "AnyOf Evidence claims requires evidence for at least one claim")
     (idris-type . "AnyHere : Evidence c -> AnyOf Evidence (c :: cs)"))))
