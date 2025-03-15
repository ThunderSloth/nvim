# *****************************************************************************
# ***************************  Python Source Code  ****************************
# *****************************************************************************
#
#   DESIGNER NAME:  Eli Bell
#
#       FILE NAME:  test.py
#
#     DESCRIPTION:
#
#       This Python script is intended for a Raspberry Pi 5, running Raspberry Pi OS
#       (bookworm) and requires the gpio_manager module, which replaces the obsolete
#       sysfs interface. The peripheral circuitry consists of
#       ... 
#       Ω
#
# *****************************************************************************

# ---------------------------------------------------
# Python Modules
# ---------------------------------------------------
import gpio_manager as GPIO
import time

# ---------------------------------------------------
# Constants
# ---------------------------------------------------

# GPIO Pin States
BUTTON_PRESSED = GPIO.PinState.LOW
LED_ON = GPIO.PinState.HIGH
LED_OFF = GPIO.PinState.LOW

# GPIO number based on BCM GPIO numbering scheme
BUTTON_PIN = 18
LED_PIN = 26

# Time Delays
READ_DELAY_200MS = 0.2
READ_DELAY_500MS = 0.5
READ_DELAY_1SEC = 1


# -----------------------------------------------------------------------------
# DESCRIPTION
#   Configures GPIO ... 
#
# INPUT PARAMETERS:
#   none
#
# OUTPUT PARAMETERS:
#   none
#
# RETURN:
#   GPIO interface object handle of the gpio_manager module.
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
def setup_gpio():
    gpio_handle = GPIO.GPIOManager()

    gpio_handle.add_input_pin(BUTTON_PIN, GPIO.InternPullResistorState.PULLUP)

    gpio_handle.add_output_pin(LED_PIN, pin_state=LED_OFF)

    gpio_handle.assign_callback(
        pin_num=BUTTON_PIN,
        callback=button_ISR_callback,
        trigger_edge=GPIO.TriggerEdge.RISING,
        debounce_time_ms=20,
    )
    
    return gpio_handle


# -----------------------------------------------------------------------------
# DESCRIPTION
#   Sets output state of LED pin.
#
# INPUT PARAMETERS:
#   gpio_handle - GPIO interface object handle of the gpio_manager module
#   pin - GPIO number based on BCM GPIO numbering scheme
#   state - GPIO module enumerator indicating high or low
#
# OUTPUT PARAMETERS:
#   none
#
# RETURN:
#   none
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
def set_led_state(gpio_handle, pin, state):
    gpio_handle.set_output_pin(pin, state)


# -----------------------------------------------------------------------------
# DESCRIPTION
#   Interrupt Service Routine to handle pushbutton press. Outputs total times
#   pressed and toggles LED state.
#
# INPUT PARAMETERS:
#   none
#
# OUTPUT PARAMETERS:
#   none
#
# RETURN:
#   none
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
def button_ISR_callback():
    if not hasattr(button_ISR_callback, "counter"):
        button_ISR_callback.counter = 0

    button_ISR_callback.counter += 1;

    gpio_handle = GPIO.GPIOManager()

    print(f"Button has been pressed {button_ISR_callback.counter} times.")

    if button_ISR_callback.counter % 2 != 0:  # Even number of presses
        print("LED turned ON.")
        set_led_state(gpio_handle, LED_PIN, LED_ON)

    else:
        print("LED turned OFF.")
        set_led_state(gpio_handle, LED_PIN, LED_OFF)


# -----------------------------------------------------------------------------
# DESCRIPTION
#   An infinite empty loop to keep program from terminating.
#   Terminates only on Keyboard Interrupt (CTRL-C).
#
# INPUT PARAMETERS:
#   none
#
# OUTPUT PARAMETERS:
#   none
#
# RETURN:
#   none
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
def loop():
    while True:
        pass

# -----------------------------------------------------------------------------
#  main() function
# -----------------------------------------------------------------------------
def main():
    button_press_counter = 0

    print("")
    print("********************** PROGRAM IS RUNNING **********************")
    print(f"********************** {"test.py":^20} **********************\n")
    print("Press CTRL-C to end the program.\n")

    try:
        gpio_handle = setup_gpio()

        loop()

    except KeyboardInterrupt:
        print("\nCTRL-C detected.")

    finally:
        gpio_handle.cleanup()
        print("")
        print("GPIO Ports have been cleaned up.\n")
        print("********************** PROGRAM TERMINATED **********************\n")


# -----------------------------------------------------------------------------
if __name__ == "__main__":
    main()

