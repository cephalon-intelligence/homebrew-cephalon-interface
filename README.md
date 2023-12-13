# homebrew-cephalon-interface

- This is the homebrew tap for the package: [cephalon-interface](https://github.com/cephalon-intelligence/cephalon-interface)
- Full documentation can be found at: [cephalon.systems](https://cephalon.systems)
- To learn more visit our main website: [cephalon.io](https://cephalon.io)
- If you plan on using the package with python, you may want to use `pip` to install the package.
    - More details can be found in the [repository](https://github.com/cephalon-intelligence/cephalon-interface) or on the [docs](https://cephalon.systems) site linked above.

## Setup

The only dependency is [homebrew](https://brew.sh/), which can be installed with:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install

Install this package via homebrew:

```sh
brew tap cephalon-intelligence/cephalon-interface
brew install cephalon-interface
```

### Upgrade

Update/upgrade the package:

```sh
brew upgrade cephalon-interface
```

If for some reason this fails, try uninstalling and reinstalling.


### Uninstall

If you're logged in, make sure you log out first:

```sh
ci logout
```

Uninstall the package:

```sh
brew uninstall cephalon-interface
```

## Developer

### Clone Repository

With SSH:

```sh
git clone git@github.com:cephalon-intelligence/homebrew-cephalon-interface.git
```

Or with HTTPS:

```sh
git clone https://github.com/cephalon-intelligence/homebrew-cephalon-interface.git
```

Optionally enter directory:

```sh
cd homebrew-cephalon-interface
```

### Generate Formula

Automatically generate the ruby formula:

```sh
./auto.sh
```

If a `permission denied` error is encountered, modify file permissions and make executable:

```sh
chmod +x auto.sh
```

Then rerun the `auto.sh` script.

### Install (Source)

Build the homebrew package from source:

```sh
brew install --build-from-source --verbose --debug Formula/cephalon-interface.rb
```