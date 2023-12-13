replacements = {
    "Shiny new formula": "API client and GUI app for interacting with Cephalon Intelligence research tools.",
    "https://github.com/cephalon-intelligence/cephalon-interface": "https://cephalon.systems",
    "python3": "python@3.11",
}

with open("./Formula/cephalon-interface.rb") as file:
    formula = file.read()
file.close()

for key, val in replacements.items():
    formula = formula.replace(key, val)

with open("./Formula/cephalon-interface.rb", "w") as file:
    file.write(formula)
file.close()
