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
#       This Python script is intended for a Raspberry Pi 5, running Raspberry
#       Pi OS (bookworm) and requires the gpio_manager module, which replaces
#       the obsolete sysfs interface. The peripheral circuitry consists of ...
#       Ω resistor
#
# *****************************************************************************

# ---------------------------------------------------
# Python Modules
# ---------------------------------------------------
import gpio_manager as GPIO

# ---------------------------------------------------
# Constants
# ---------------------------------------------------

# GPIO number based on BCM GPIO numbering scheme
BUTTON_PIN = 18
LED_PIN = 26

# -----------------------------------------------------------------------------
# FUNCTION NAME:
#   setup_gpio()
#
# DESCRIPTION: 
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
def setup_gpio():
    gpio_handle = GPIO.GPIOManager()

    # https://gpio-manager.readthedocs.io/en/latest/index.html 

    return gpio_handle


# -----------------------------------------------------------------------------
# FUNCTION NAME:
#   main()
#
# DESCRIPTION: 
#   Main Method: configures GPIO and ...
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
def main():

    gpio_handle = setup_gpio()

    try:
        pass


    except KeyboardInterrupt:
        print("\nCTRL-C detected.")

    finally:
        gpio_handle.cleanup()
        print("\nGPIO Ports have been cleaned up.")


# *****************************************************************************
if __name__ == "__main__":
    print("\n********************** PROGRAM IS RUNNING **********************")
    print(f"********************** {'[:VIM_EVAL:]expand("%p")[:END_EVAL:]':^18} **********************\n")
    print("Press CTRL-C to end the program.\n")

    main()

    print("\n********************** PROGRAM TERMINATED **********************\n")

