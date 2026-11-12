# Testing wix

Run `chef install Policyfile.rb`, `chef exec rspec` and `cookstyle` locally.
The resource specs step into installation, explicit agreement acceptance and
removal, including checksums, custom homes and unverified-version rejection.

Hosted Windows Server 2022/2025 CI checks the actual installed CLI and MSI
version, machine PATH/WIX7 entries, a second unchanged converge and uninstall.
Local Vagrant Windows 2019/2022 suites remain available with .NET Framework
4.7.2 or later. The removal suite exercises a lifecycle in one converge.

The separate build suite creates a real MSI from fixture authoring. It is gated
by WIX_ACCEPT_EULA=true and must run only after an authorised owner accepts the
WiX OSMF EULA for that execution account/organisation. Version checks do not
prove build acceptance. This Mac ARM host cannot execute x64 Windows guests.
