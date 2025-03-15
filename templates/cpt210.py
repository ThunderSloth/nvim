# *****************************************************************************
# ***************************  Python Source Code  ****************************
# *****************************************************************************
#
#   DESIGNER NAME:  Eli Bell
#
#       FILE NAME:  [:VIM_EVAL:]expand("%p")[:END_EVAL:]
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
        callback=print,
        trigger_edge=GPIO.TriggerEdge.RISING,
        debounce_time_ms=20,
    )
    
    return gpio_handle


# -----------------------------------------------------------------------------
#  main() function
# -----------------------------------------------------------------------------
def main():

    try:
        gpio_handle = setup_gpio()


    except KeyboardInterrupt:
        print("\nCTRL-C detected.")

    finally:
        gpio_handle.cleanup()
        print("\nGPIO Ports have been cleaned up.")


# -----------------------------------------------------------------------------
if __name__ == "__main__":
    print("\n********************** PROGRAM IS RUNNING **********************")
    print(f"********************** {'[:VIM_EVAL:]expand("%p")[:END_EVAL:]':^18} **********************\n")
    print("Press CTRL-C to end the program.\n")

    main()

    print("\n********************** PROGRAM TERMINATED **********************\n")

