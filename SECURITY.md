# Security

This repository contains guides and templates for agent fleets. Treat any real Hermes profile, provider token, messaging token, or deployment credential as sensitive.

## Do Not Commit

- `.env` files with real secrets
- Hermes profile homes
- `HERMES_HOME`
- session logs
- memory databases
- cloud provider credentials
- messaging bot tokens

## Reporting

For issues in this independent guide repo, open a GitHub issue or contact the maintainer directly. For vulnerabilities in Hermes Agent itself, report through the official Nous Research Hermes Agent project.

## Deployment Notes

- Put dashboards behind auth when exposed beyond localhost.
- Use persistent volumes for Hermes home directories.
- Use provider/platform secret stores rather than plaintext environment files.
- Review any third-party "managed Hermes" offering before giving it code, browser, or shell access.
