# wix_install

Install the official WiX command-line tools MSI on x64 Windows. The MSI's
.NET Framework binaries require .NET Framework 4.7.2 or later. Manage that shared
prerequisite in your wrapper cookbook; uninstall does not remove it.

## Actions

- `:install` (default): install the verified MSI, optionally accept the usage
  agreement explicitly for the Chef execution account.
- `:remove`: use the registered MSI uninstaller. It removes owned tool files,
  PATH/WIX7 entries and extensions according to MSI component reference counts.
  Shared user agreement records and shared .NET Framework remain.

## Properties

| Property | Type | Default | Meaning |
| --- | --- | --- | --- |
| `version` | String | `7.0.1` | Three-component WiX version; the MSI version adds `.0`. |
| `source` | String | Official GitHub versioned x64 MSI URL | Installer source. |
| `checksum` | String | Verified 7.0.1 SHA-256 | Explicit checksum required for another version. |
| `package_name` | String | `WiX Toolset Command-Line Tools` | Registered MSI package name. |
| `home` | String | `C:/Program Files/WiX Toolset v7.0` | MSI INSTALLFOLDER override; executable is under `bin`. |
| `accept_eula` | Boolean | false | Explicitly invoke `wix eula accept wix7` for the current Chef user. |

```ruby
wix_install 'build tools' do
  home 'C:/Build Tools/WiX'
end

wix_install 'remove build tools' do
  action :remove
end
```

`accept_eula true` writes the upstream per-user agreement record under that
account's `.wix` directory. This does not accept the agreement for another build
user. The record is shared by that account's WiX 7 installations and is preserved
on uninstall. Read the [OSMF agreement](https://wixtoolset.org/osmf/) and choose
acceptance only when authorised for the account and organisation.
