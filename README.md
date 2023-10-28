# osx_ansible

Automated personalized configuration of OSX. 

## Installation

Use the apply.sh to idempotently install xcode, rosetta, and the ansible configuration. The apply.sh will also localy execute the ansible playbook to configure the host system as defined.

```bash
./apply.sh
```

## Usage

```python
import foobar

# returns 'words'
foobar.pluralize('word')

# returns 'geese'
foobar.pluralize('goose')

# returns 'phenomenon'
foobar.singularize('phenomena')
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.
