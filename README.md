# Create a Custom Pip Index for Python Package Wheels

Use the action to create a pip package index from a direcory of wheels (`*.whl`)

Use the Action:

```yml
- name: Make package index
  uses: banesullivan/create-pip-index-action@main
  with:
    package_directory: dist/
```

Example workflow that publishes you wheel to a package index on GitHub Pages:

```yml
name: Publish Wheel to GitHub Pages

on:
  workflow_dispatch:
  push:
    branches:
      - main

jobs:
  publish-wheel:
    name: Publish Wheel to GH Pages
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: "3.8"
      - name: Build Weel
        run: |
          pip install wheel
          python setup.py bdist_wheel
      - name: Make package index
        uses: banesullivan/create-pip-index-action@main
        with:
          package_directory: dist/
      - name: Deploy to GH Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: dist/
```

## Inputs

- `package_directory`: Path to the directory containing the wheels/packages. A new index.html file will be placed in this direcory.
