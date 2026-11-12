# wix contributor notes

## Confirmed scope

The owner selected the full recipe/attribute migration and current WiX instead
of the EOL v3 default. Land through a feature PR to main, then let Release Please
replace the pending patch release with a major release. Preserve non-EOL Windows
Server platforms and document framework prerequisites and real acceptance gaps.

## Primary research

WiX 7.0.1 was released 2026-10-26. Its official GitHub x64 MSI and metadata
declare product name WiX Toolset Command-Line Tools, MSI version 7.0.1.0,
product code {9C03C98E-E311-4089-85C3-953259120122}, and SHA-256
93673c89ab33b1fd3f07ad5e609b7cae694bd716b2914259b61a41c02303b64c.
The downloaded MSI hash matches. Its source installs net472 binaries, PATH and
WIX7 plus shared extensions. No dotnet tool installation is necessary.

- [Official release](https://github.com/wixtoolset/wix/releases/tag/v7.0.1)
- [MSI definition](https://github.com/wixtoolset/wix/blob/v7.0.1/src/setup/wix-cli/Package.wxs)
- [Framework target](https://github.com/wixtoolset/wix/blob/v7.0.1/src/setup/wix-cli/wix-cli.wixproj)
- [EULA command implementation](https://github.com/wixtoolset/wix/blob/v7.0.1/src/wix/WixToolset.Core/CommandLine/EulaCommand.cs)
- [Current release notes](https://docs.firegiant.com/wix/whatsnew/releasenotes/)

The OSMF agreement requires an explicit user gesture for builds. Never enable
accept_eula by default. Its per-user record is shared by WiX 7 installs and is
preserved on removal. The optional build fixture requires WIX_ACCEPT_EULA=true;
do not run it before explicit owner consent for that account/CI usage.

## Verification

Use Policyfile resolution, meaningful step_into ChefSpec, Cookstyle, YAML and
Markdown lint and InSpec profile checks. Native Windows 2022/2025 CI verifies
installation, CLI version, second-converge idempotency, uninstall and environment
cleanup without accepting the build agreement. The separately gated build suite
compiles a real MSI once its agreement is authorised. A Mac ARM host cannot run
the x64 Windows Vagrant suites. Do not claim full build acceptance from version
checks alone.
