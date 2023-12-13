Originally this used homebrew-pypi-poet. Ideally, one defines all the dependencies and their checksums in the `.rb` file (which is what poet does). For some reason, doing this causes a cmake compilation error with `ninja`, which in turn is a dependency for `numpy`.

Given that `pip` seems to resolve this somehow, ideally we would circumvent this by just using pip to install our dependencies. Unfortunately, pip is disabled by default in the homebrew virtual envirotnment. Fortunately, we can circumvent this by adding pip *as the only dependency*, and then using that newly installed pip to install just the cephalon-interface package.

Doing this seems to fix the compilation errors.