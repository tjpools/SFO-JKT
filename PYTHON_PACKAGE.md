# SFO-JKT Flight Tracker Python Package

This directory contains the pip-installable Python package.

## Installation

### From PyPI (once published)
```bash
pip install sfo-jkt-tracker
```

### From source (local development)
```bash
# Clone the repository
git clone https://github.com/tjpools/SFO-JKT.git
cd SFO-JKT

# Install in editable mode
pip install -e .

# Or install normally
pip install .
```

### From GitHub
```bash
pip install git+https://github.com/tjpools/SFO-JKT.git
```

## Usage

### Command line
After installation, you can run the tracker from anywhere:

```bash
# Full command
flight-tracker

# Or short alias
sfo-jkt
```

### Python module
```python
from flight_tracker import create_itinerary

itinerary = create_itinerary()
itinerary.display_itinerary()
itinerary.display_summary_table()
```

## Development

### Install development dependencies
```bash
pip install -e ".[dev]"
```

### Run tests
```bash
pytest
```

### Format code
```bash
black flight_tracker.py
```

### Lint code
```bash
flake8 flight_tracker.py
```

## Build and Publish

### Build distribution
```bash
python -m pip install --upgrade build
python -m build
```

This creates `dist/sfo-jkt-tracker-1.0.0.tar.gz` and `dist/sfo_jkt_tracker-1.0.0-py3-none-any.whl`

### Publish to PyPI (requires account)
```bash
python -m pip install --upgrade twine
python -m twine upload dist/*
```

### Test on TestPyPI first
```bash
python -m twine upload --repository testpypi dist/*
pip install --index-url https://test.pypi.org/simple/ sfo-jkt-tracker
```

## Package Structure

```
SFO-JKT/
├── flight_tracker.py       # Main module
├── pyproject.toml          # Package metadata and build config
├── requirements.txt        # Runtime dependencies
├── README.md              # Package documentation
└── LICENSE                # MIT License
```

## Features

- ✅ Zero-config command-line tool
- ✅ Importable Python module
- ✅ Type hints and docstrings
- ✅ Timezone-aware datetime handling
- ✅ Formatted table output
- ✅ Cross-platform (Windows, macOS, Linux)
- ✅ Python 3.7+ compatible

## License

MIT License - see LICENSE file for details

## Links

- Repository: https://github.com/tjpools/SFO-JKT
- Issues: https://github.com/tjpools/SFO-JKT/issues
- Changelog: https://github.com/tjpools/SFO-JKT/blob/main/CHANGELOG.md
