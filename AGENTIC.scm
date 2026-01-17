;; SPDX-License-Identifier: MPL-2.0
;; AGENTIC.scm - AI agent gating policies for idris2-dyadt

(define-module (idris2-dyadt agentic)
  #:export (gating-policies entropy-budgets risk-classifications))

(define gating-policies
  '((default
     (mode . "moderate")
     (require-explicit-intent . #f)
     (description . "Claim verification is safe, but evidence construction needs care"))

    (claim-construction
     (mode . "auto-approve")
     (require-explicit-intent . #f)
     (description . "Constructing claims is declarative and safe"))

    (evidence-construction
     (mode . "gated")
     (require-explicit-intent . #f)
     (description . "Evidence construction may involve external verification")
     (reason . "Some evidence requires echidna prover calls"))

    (runtime-verification
     (mode . "strict")
     (require-explicit-intent . #t)
     (description . "Runtime verification performs IO operations")
     (reason . "File checks, command execution require approval"))))

(define entropy-budgets
  '((session
     (max-entropy . 100)
     (current . 0)
     (reset-on . "session-end"))
    (operation-costs
     (claim-construct . 0)
     (evidence-construct . 2)
     (verify-compile-time . 0)
     (verify-runtime . 15)
     (echidna-prove . 20)
     (cno-wrap . 0)
     (file-check . 5))))

(define risk-classifications
  '((none
     (operations . ("claim-construct" "verify-compile-time" "cno-wrap"))
     (auto-approve . #t)
     (reason . "Compile-time operations have no runtime effect"))
    (low
     (operations . ("evidence-construct"))
     (auto-approve . #t)
     (log-decision . #t))
    (medium
     (operations . ("echidna-prove" "file-check"))
     (require-confirmation . #f)
     (log-decision . #t))
    (high
     (operations . ("verify-runtime" "command-execution"))
     (require-confirmation . #t)
     (log-decision . #t))))
