# todo: fix tech debt

import re

replacements = {
    "Shiny new formula": "API client and GUI app for interacting with Cephalon Intelligence research tools.",
    "https://github.com/cephalon-intelligence/cephalon-interface": "https://cephalon.systems",
    'depends_on "python3"': 'depends_on "python@3.11"',
    'virtualenv_create(libexec, "python3")': 'virtualenv_create(libexec, "python3.11")',
}

with open("./Formula/cephalon-interface.rb") as file:
    formula = file.read()
file.close()

for key, val in replacements.items():
    formula = formula.replace(key, val)


with open("./Formula/cephalon-interface.rb", "w") as file:
    file.write(formula)
file.close()


pip_installs = """
    resource("pip").stage do
      system libexec/"bin/python", "setup.py", "install"
    end

    system libexec/"bin/pip", "install\""""

def get_resource_indices(formula: list[str]) -> tuple[int, int]:
    """
    Get the indices of the resource block in the formula.
    """
    start = formula.index('  depends_on "python@3.11"')
    end = formula.index("  def install")
    return start, end

def get_dependencies(formula: list[str]) -> list[str]:
    start, end = get_resource_indices(formula)
    resources = formula[start+1:end]
    resources = [i.strip().split("/")[-1][:-1] for i in resources if "https://" in i]
    resources = [re.split("-(?=\d)", i) for i in resources]
    dependencies = list()
    for r in resources:
        dependencies.append(f"\"{r[0]}=={r[1][:-7]}\"")
    return dependencies


with open("Formula/cephalon-interface.rb") as file:
    formula = file.read().split("\n")
file.close()

with open("temp/pip.rb") as file:
    pip_resource = file.read()
file.close()


start, end = get_resource_indices(formula)
front = "\n".join(formula[:start+1]) + "\n\n" + pip_resource + "\n"

tail = formula[end:]
insert_deps_after = tail.index('    virtualenv_create(libexec, "python3.11")')
back = "\n".join(tail[:insert_deps_after+1] + ", ".join([pip_installs] + get_dependencies(formula)).split("\n") + tail[insert_deps_after+1:])
new_formula = front + back

with open("Formula/cephalon-interface.rb", "w") as file:
    file.write(new_formula)
file.close()