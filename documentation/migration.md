# Migrating to wix cookbook 7.0

The owner selected a full migration to current WiX rather than retaining the
EOL v3 toolset. Root recipes and attributes are removed. Replace the
`wix::default` run-list entry with a wrapper recipe declaring `wix_install 'WiX'`.
Replace `node['wix']['home']` with the `home` property and the old archive
checksum attribute with the MSI `checksum` property. The new package format
requires an MSI checksum; the old ZIP checksum is not compatible.

The default is WiX 7.0.1, installed from its official x64 MSI. The versioned
GitHub asset digest and downloaded binary SHA-256 match. The MSI manages PATH,
WIX7, its binary files and shared extensions. `home` now denotes the MSI root;
`wix.exe` lives under `<home>/bin`. The MSI is the official available Windows
installer for this release and is x64; it replaces the old architecture-neutral
ZIP extraction approach.

Chef Infra Client 16+ and .NET Framework 4.7.2+ are required. Windows Server
2016 and 2019 remain supported with the framework prerequisite; hosted CI
checks actual Windows Server 2022 and 2025 runners. The resource leaves a
shared framework installation in place on removal.

WiX 7 uses the `wix` CLI. Legacy `candle.exe`, `light.exe` and `heat.exe` commands
are not supplied. Convert old WiX authoring and update build commands using the
upstream migration guidance. WiX 7 removed Heat in favour of modern Files and
Payloads authoring.

Building packages requires explicit OSMF EULA acceptance. The resource does not
accept this by default. If authorised, `accept_eula true` performs the upstream
per-user gesture for the Chef account; build users must accept for their own
accounts. The agreement can carry an organisational maintenance fee under its
terms. CLI version checks do not constitute agreement acceptance.

The feature PR keeps the current cookbook metadata version. Release Please
should generate a 7.0.0 cookbook release after the breaking feature reaches main,
replacing #56. WiX tool version 7.0.1 and cookbook version 7.0.0 are independent.
