# Robot Framework + Appium Mobile Testing

A well-structured project for mobile automation testing using Robot Framework and Appium.

## Quick Start

### Prerequisites
- Python 3.8+
- Appium server running (typically on `http://localhost:4723/wd/hub`)
- Android emulator or iOS simulator
- Android/iOS app built and available

### Installation

```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate  # On macOS/Linux
# OR
venv\Scripts\activate  # On Windows

# Install dependencies
pip install -r requirements.txt

# Start Appium server (in another terminal)
appium
```

### After Setup
When returning to the project, always activate the virtual environment first:
```bash
source venv/bin/activate
```

### First Test Run

```bash
# Run smoke tests
robot --outputdir results tests/smoke/

# Run specific test file
robot tests/smoke/login.robot

# Run with tag
robot --include smoke tests/

# View results
open results/report.html
```

## Project Structure

- **tests/**: Test files organized by type (smoke, functional, regression)
- **resources/**: Resource files with keywords and locators
- **keywords/**: Reusable keyword libraries
- **libraries/**: Custom Python libraries for complex logic
- **config/**: Appium server and capabilities configuration
- **results/**: Test execution reports and logs

## Key Concepts

### Test Organization
Tests are organized by category and feature:
- `smoke/`: Critical functionality tests
- `functional/`: Feature-specific tests  
- `regression/`: End-to-end regression tests

### Locators
All application element locators are centralized in `resources/locators.robot` for easy maintenance and updates.

### Keywords
- `resources/common.robot`: Shared keywords used across tests
- `resources/login_keywords.robot`: Feature-specific keywords (example)
- Keywords follow naming pattern: `Action + Target` (e.g., "Wait And Click Element")

### Configuration
- `config/appium_server.robot`: Appium server URL and desired capabilities
- Easily switch between Android/iOS or different devices
- Centralized capability management for maintainability

## Test Development Workflow

1. **Add locators** to `resources/locators.robot`
2. **Create feature keywords** in `resources/{feature}_keywords.robot`
3. **Write test cases** in `tests/{category}/{feature}.robot`
4. **Reference resources** with proper imports
5. **Execute and validate** with `robot` command

## Best Practices Implemented

✅ Clear test case names describing business value  
✅ Reusable keywords with single responsibility  
✅ Centralized locator management  
✅ Proper setup/teardown for test isolation  
✅ Feature-organized test structure  
✅ Configuration separation from tests  
✅ Custom Python libraries for complex logic  
✅ Documentation in resource files  

## Common Commands

```bash
# Run all tests
robot tests/

# Run with output in specific directory
robot --outputdir results tests/

# Run tests matching tag
robot --include smoke tests/

# Run tests excluding tag
robot --exclude wip tests/

# Run in parallel (requires robotframeworkparllelizer)
robot --parallel 4 tests/

# Debug specific test
robot --loglevel DEBUG tests/smoke/login.robot
```

## Example: Writing Your First Test

1. Update `resources/locators.robot` with your app's element IDs
2. Update `config/appium_server.robot` with your device capabilities
3. Create test file: `tests/smoke/my_feature.robot`
4. Import resources at top of file
5. Write test case describing business scenario
6. Use keywords to interact with app

## Troubleshooting

- **Appium not found**: Ensure Appium server is running on configured URL
- **Element not found**: Verify locator strategy and app under test
- **Timeout errors**: Increase wait times in capabilities or use explicit waits
- **Device connection**: Check device is visible with `adb devices` (Android)

See `CLAUDE.md` for detailed documentation and best practices.
