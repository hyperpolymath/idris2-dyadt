# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability in idris2-dyadt, please report it by:

1. **DO NOT** open a public GitHub issue
2. Email the maintainer at security@hyperpolymath.org
3. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

We will acknowledge receipt within 48 hours and provide a detailed response within 7 days.

## Security Considerations

### Claim Verification

This library provides compile-time verification through dependent types. Security notes:

- **Type Safety**: Claims are verified at compile time; runtime bypasses are not possible
- **Evidence Construction**: Evidence values cannot be forged without valid proofs
- **believe_me Usage**: Some internal modules use `believe_me` for efficiency; these are carefully reviewed

### Integration Security

When using echidna or CNO integrations:

- External prover inputs are sanitized
- CNO proofs are verified at compile time
- No runtime code execution from claim verification

## Security Updates

Security updates will be released as patch versions and announced via:

- GitHub Security Advisories
- Release notes

## Acknowledgments

We thank all security researchers who responsibly disclose vulnerabilities.
