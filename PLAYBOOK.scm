;; SPDX-License-Identifier: PMPL-1.0-or-later
;; PLAYBOOK.scm - Operational runbook for idris2-dyadt

(define-module (idris2-dyadt playbook)
  #:export (derivation-source procedures alerts))

(define derivation-source
  '((type . "derived")
    (meta-rules . (adr-001 adr-002 adr-003))
    (state-context . "v0.1.0-released")
    (timestamp . "2025-01-17T20:00:00Z")))

(define procedures
  '((build
     (description . "Build the idris2-dyadt package with dependencies")
     (preconditions . ("idris2-echidna-installed" "idris2-cno-installed"))
     (steps
       ((step 1) (action . "idris2 --build idris2-dyadt.ipkg") (timeout . 300))
       ((step 2) (action . "idris2 --check tests/TestClaims.idr") (timeout . 180)))
     (on-failure . "abort-and-notify"))

    (install-deps
     (description . "Install required dependencies")
     (steps
       ((step 1) (action . "cd ../idris2-echidna && idris2 --install idris2-echidna.ipkg") (timeout . 300))
       ((step 2) (action . "cd ../idris2-cno && idris2 --install idris2-cno.ipkg") (timeout . 180)))
     (on-failure . "abort"))

    (install
     (description . "Install to local Idris2 package path")
     (preconditions . ("build-successful"))
     (steps
       ((step 1) (action . "idris2 --install idris2-dyadt.ipkg") (timeout . 180)))
     (on-failure . "abort"))

    (test
     (description . "Run claim verification tests")
     (steps
       ((step 1) (action . "idris2 --check tests/TestClaims.idr") (timeout . 180)))
     (on-failure . "report-failure"))

    (verify-claims
     (description . "Verify example claims compile")
     (steps
       ((step 1) (action . "idris2 --check src/Dyadt/Examples.idr") (timeout . 120)))
     (on-failure . "claim-verification-failed"))))

(define alerts
  '((claim-verification-failed
     (severity . "high")
     (channels . ("log"))
     (message . "Dyadt claim verification failed - evidence insufficient"))))
