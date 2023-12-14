# Notes

## Compilation Errors and Pip

Originally this had homebrew-pypi-poet to generate the resource links directly. Ideally, one defines all the dependencies and their checksums in the `.rb` file (which is what poet does). For some reason, doing this causes a cmake compilation error with `ninja`, which in turn is a dependency for `numpy`.

Given that `pip` seems to resolve this somehow, ideally we would circumvent this by just using pip to install our dependencies. Unfortunately, pip is disabled by default in the homebrew virtual envirotnment. Fortunately, we can circumvent this by adding pip *as the only dependency*, and then using that newly installed pip to install just the cephalon-interface package dependencies, which is done by the `edit.py` script.

Doing this seems to fix the compilation errors.

## Developer Snippets

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

### Create Ruby Formula

If necessary (permission error):

```sh
chmod +x auto.sh
```

Run auto generation:

```sh
./auto.sh
```

### Install (Source)

Build the homebrew package from source:

```sh
brew install --build-from-source --verbose --debug Formula/cephalon-interface.rb
```

Reinstall:

```sh
brew reinstall --build-from-source --verbose --debug Formula/cephalon-interface.rb
```