# Robot Framework + Appium Mobile Testing Project

## Project Overview
This project demonstrates mobile testing best practices using Robot Framework with Appium driver.

## Project Structure

```
robot-appium-tests/
├── tests/                      # Test files organized by feature
│   ├── smoke/
│   ├── functional/
│   └── regression/
├── resources/                  # Resource files and locators
│   ├── common/                 # Shared resources
│   └── locators/              # Application element locators
├── keywords/                   # Custom keyword libraries (Robot format)
├── libraries/                  # Python custom libraries
├── config/                     # Configuration files
├── results/                    # Test execution results
├── requirements.txt            # Python dependencies
└── README.md
```

## Best Practices Implemented

### 1. Test Organization
- Tests grouped by type (smoke, functional, regression)
- Each feature/module in separate .robot files
- Clear naming: `feature_name.robot`
- One test suite per file or logical grouping

### 2. Naming Conventions
- **Test Cases**: Descriptive, business-readable (e.g., "User should be able to login with valid credentials")
- **Keywords**: Verb-action format (e.g., "Click Login Button", "Verify Welcome Message")
- **Variables**: UPPERCASE for constants, lowercase for local variables
- **Files**: lowercase_with_underscores.robot

### 3. Resource Files
- `common.robot`: Shared imports, setup/teardown, common variables
- `locators.robot`: Application element locators (locator strategies)
- Feature-specific resources: `feature_name_keywords.robot`
- Locators separated from test logic for maintainability

### 4. Keyword Guidelines
- Single responsibility principle
- Reusable and composable
- Clear return values when needed
- Documentation strings for each keyword
- Avoid hardcoded values (use variables/parameters)

### 5. Test Data
- External test data files (.json, .csv) for data-driven tests
- Page Object Model principles for mobile app screens
- Separation of locators from test execution

### 6. Setup and Teardown
- Suite Setup/Teardown: Device initialization, server startup
- Test Setup/Teardown: App state reset, cleanup
- Use `*** Settings ***` section properly

### 7. Code Quality
- DRY principle (Don't Repeat Yourself)
- Comments for non-obvious logic only
- Consistent indentation (2 spaces is Robot standard)
- Use proper section ordering: Settings → Variables → Keywords → Test Cases

### 8. Appium-Specific
- Device/app configuration in separate resource files
- Capability management (desiredCapabilities)
- Wait strategies for mobile elements
- Handle app background/foreground scenarios

## Configuration Management
- `config/appium_server.robot`: Appium server configuration
- `config/desired_capabilities.json`: Device/app capabilities
- Environment-specific configs for different devices/OS versions

## Test Execution
- Run by directory: `robot --outputdir results tests/smoke/`
- Run by tag: `robot --include smoke tests/`
- Parallel execution for faster feedback
- Generate HTML reports automatically

## Key Libraries
- **AppiumLibrary**: Mobile automation via Appium
- **Collections**: List/Dictionary operations
- **BuiltIn**: Core Robot Framework functionality
- **String**: String manipulation utilities

## Dependencies
See `requirements.txt` for exact versions and setup instructions.

## Tips for Learning
1. Start with simple login tests
2. Understand locator strategies (id, xpath, accessibility-id, etc.)
3. Use Robot's built-in keywords before custom ones
4. Leverage Resource files for code reuse
5. Test locally before CI/CD integration
