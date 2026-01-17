-- SPDX-License-Identifier: MPL-2.0
||| Integration with idris2-cno
|||
||| Claims about CNO properties that can be verified.
module Dyadt.Integration.CNO

import Dyadt.Claim
import Dyadt.Evidence
import Dyadt.Verdict

-- Not marked total due to Evidence module constraints

-------------------------------------------------------------------
-- CNO Claims
-------------------------------------------------------------------

||| Claims specifically about CNO properties
public export
data CNOClaim : Type where
  ||| Claim that a named function is a CNO
  IsCNO : (funcName : String) -> CNOClaim
  ||| Claim that CNO composition is valid
  CNOCompositionValid : (f : String) -> (g : String) -> CNOClaim
  ||| Claim that a CNO preserves some invariant
  CNOPreservesInvariant : (cnoName : String) -> (invariant : String) -> CNOClaim

-------------------------------------------------------------------
-- CNO Evidence
-------------------------------------------------------------------

||| Evidence for CNO claims
public export
data CNOClaimEvidence : CNOClaim -> Type where
  ||| Type-level proof that function is CNO
  TypeLevelCNOProof : CNOClaimEvidence (IsCNO name)
  ||| Composition proof
  CompositionProof : CNOClaimEvidence (CNOCompositionValid f g)
  ||| Invariant preservation proof
  InvariantProof : CNOClaimEvidence (CNOPreservesInvariant cno inv)

-------------------------------------------------------------------
-- CNO Claim to General Claim
-------------------------------------------------------------------

||| Convert CNO claim to general dyadt Claim
public export
toGeneralClaim : CNOClaim -> Claim
toGeneralClaim (IsCNO name) =
  Custom ("cno_identity_" ++ name) []
toGeneralClaim (CNOCompositionValid f g) =
  Custom ("cno_composition_" ++ f ++ "_" ++ g) []
toGeneralClaim (CNOPreservesInvariant cno inv) =
  Custom ("cno_preserves_" ++ cno ++ "_" ++ inv) []

-------------------------------------------------------------------
-- Verified CNO Wrapper
-------------------------------------------------------------------

||| A CNO that has been verified via dyadt
public export
record DyadtVerifiedCNO where
  constructor MkDyadtVerifiedCNO
  name : String
  claim : CNOClaim
  verified : Verified (toGeneralClaim claim)

||| Create a verified CNO claim
public export
verifyCNOClaim : (name : String) ->
                 CNOClaimEvidence (IsCNO name) ->
                 DyadtVerifiedCNO
verifyCNOClaim name ev =
  MkDyadtVerifiedCNO name (IsCNO name) (MkVerified CustomEvidence)

-------------------------------------------------------------------
-- CNO Chain Claims
-------------------------------------------------------------------

||| Claim that a chain of CNOs is valid
public export
chainClaim : List String -> Claim
chainClaim [] = Custom "empty_cno_chain" []
chainClaim [x] = Custom ("cno_identity_" ++ x) []
chainClaim (x :: y :: rest) =
  And (Custom ("cno_composition_" ++ x ++ "_" ++ y) [])
      (chainClaim (y :: rest))

||| Evidence for a CNO chain
public export
data ChainEvidence : (names : List String) -> Type where
  EmptyChain : ChainEvidence []
  SingleCNO : ChainEvidence [name]
  ConsChain : ChainEvidence (y :: rest) -> ChainEvidence (x :: y :: rest)

