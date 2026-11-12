# wix cookbook

Install current WiX Toolset command-line tools with a custom resource.
Requires Chef Infra Client 16+, x64 Windows and .NET Framework 4.7.2 or later.
Windows Server 2016/2019/2022/2025 remain supported with that prerequisite.

```ruby
wix_install 'WiX'
```

The default is the verified official WiX 7.0.1 MSI. It installs `wix.exe`,
extensions, the machine PATH entry and WIX7 variable. The registered MSI handles
upgrades and uninstall without removing shared components still in use.

WiX 7 requires explicit acceptance of its OSMF usage agreement before building
packages. Review that agreement before selecting `accept_eula true`; the
cookbook does not accept it by default.

To approve, read the [OSMF agreement](https://wixtoolset.org/osmf/), confirm you
are authorised to accept it for the organisation and execution account, then
set the resource property explicitly:

```ruby
wix_install 'WiX' do
  accept_eula true
end
```

This accepts for the Chef execution account. A different build user can use
`wix eula accept wix7` under that account after the same approval. CI does not
enable acceptance automatically; its separately gated build fixture needs
explicit owner consent.

See the [resource reference](documentation/wix_install.md),
[migration guide](documentation/migration.md) and [testing guide](TESTING.md).

## Licence

Apache-2.0. Original cookbook by Chef Software, Inc.; maintained by Sous Chefs.
The installed WiX distribution and its usage agreement have separate terms.
