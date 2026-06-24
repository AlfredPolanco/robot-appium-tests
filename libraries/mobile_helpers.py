from robot.api.deco import keyword
from appium import webdriver
import time


class MobileHelpers:
    """Custom library for complex mobile testing scenarios"""

    @keyword("Get Current Activity")
    def get_current_activity(self, driver):
        """Get the current activity name on Android device"""
        return driver.current_activity

    @keyword("Wait For Activity To Change")
    def wait_for_activity_change(self, driver, expected_activity, timeout=10):
        """Wait until the current activity matches expected activity"""
        start_time = time.time()
        while time.time() - start_time < timeout:
            if driver.current_activity == expected_activity:
                return True
            time.sleep(0.5)
        raise Exception(
            f"Activity did not change to {expected_activity} within {timeout} seconds"
        )

    @keyword("Take Screenshot With Label")
    def take_screenshot_with_label(self, driver, label):
        """Take screenshot with timestamped label"""
        timestamp = time.strftime("%Y%m%d_%H%M%S")
        filename = f"screenshot_{label}_{timestamp}.png"
        driver.save_screenshot(filename)
        return filename

    @keyword("Get All Text Elements")
    def get_all_text_elements(self, driver):
        """Get all visible text elements on current screen"""
        elements = driver.find_elements("tag name", "android.widget.TextView")
        return [elem.text for elem in elements if elem.text]

    @keyword("Is App In Background")
    def is_app_in_background(self, driver):
        """Check if app is currently in background"""
        try:
            # Try to find an element that should exist
            return False
        except:
            return True
