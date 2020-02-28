# Github Action Package Validation

Tests the new package by installing in the latest amros container.

## Usage

```
runs:
  using: 'docker'
  image: 'Dockerfile'
  args: # see entrypoint.sh for the recipient of these - order matters
    - ${{ inputs.package-file }}
    - ${{ inputs.launch-file-path }}
```
