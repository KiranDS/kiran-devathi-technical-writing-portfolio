# LedgerLite API documentation update — authentication, examples, and errors

This overlay updates the existing LedgerLite project. It is intended to be extracted into the GitHub repository at:

`projects/01-rest-api-documentation/`

It replaces the OpenAPI contract, authentication and error guides, quickstart, and three endpoint guides. It adds standalone OAuth token examples and representative error payloads.

**Important:** LedgerLite remains fictional. The `.example` hosts are reserved for documentation examples and are not live. The token exchange example is illustrative and is not a claim that an authorization server exists or that the example was executed.

## Files included

- `openapi/ledgerlite-v1.yaml`
- `docs/authentication.md`
- `docs/errors.md`
- `docs/quickstart.md`
- `docs/endpoints/create-ledger-entry.md`
- `docs/endpoints/retrieve-ledger-entry.md`
- `docs/endpoints/list-ledger-entries.md`
- `examples/oauth-token-request.json`
- `examples/oauth-token-response.json`
- `examples/errors/*.json`

## Apply to GitHub

1. Extract the ZIP.
2. Open the repository and navigate to `projects/01-rest-api-documentation/`.
3. Upload the extracted `openapi`, `docs`, and `examples` contents into their matching existing folders. Allow GitHub to replace files with the same paths.
4. Do not upload the outer `projects` folder inside the existing project folder; preserve the paths listed above.
5. Commit to `main` with message: `Expand LedgerLite authentication and API examples`.

The GitHub Pages site uses a separate `site/` folder. If its OpenAPI file is a copied standalone file rather than a reference to this project file, sync the updated YAML into `site/openapi/ledgerlite-v1.yaml` as a separate upload so Redoc and Swagger display the new examples and error responses.

## Review notes

The OAuth 2.0 client-credentials grant and scopes are retained from the existing contract. The token request uses HTTP Basic client authentication as an explicitly illustrative example; the actual method must be confirmed for a real service. Token lifetime, revocation, signing, client registration, and account-level authorization details are called out as implementation decisions rather than invented facts.
