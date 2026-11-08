# API contract and documentation review checklist

## Represented in this portfolio contract

- [x] Base path and version stated.
- [x] HTTP methods and endpoint paths documented.
- [x] Path, query, header, and body parameters identified.
- [x] Required and optional fields distinguished.
- [x] Request and response examples included.
- [x] Success and error status codes listed.
- [x] Authentication and illustrative scopes described.
- [x] Pagination behavior documented.
- [x] Idempotency behavior described.
- [x] OpenAPI 3.1 contract supplied.

## Requires real product-owner or engineering confirmation

- [ ] Supported currencies and precision rules.
- [ ] Idempotency key retention and concurrency semantics.
- [ ] Rate-limit quotas and reset behavior.
- [ ] Token lifecycle and revocation behavior.
- [ ] Production and sandbox environments.
- [ ] Exact authorization and resource-disclosure policy.
- [ ] Error codes and response behavior against implementation.
- [ ] Pagination consistency guarantees.

## Validation and publication

- [ ] Validate OpenAPI syntax with an OpenAPI 3.1-compatible validator.
- [ ] Generate or render reference docs and inspect the output.
- [ ] Execute examples against an authorized sandbox.
- [ ] Review contract with Engineering and QA.
- [ ] Review authentication and data handling with Security.
- [ ] Obtain API-owner approval before publishing as product documentation.

Do not describe this sample as a tested or production API. The examples and contract are illustrative.
