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
# *****************************************************************************

def func():
    pass

def main():
    func()

# -----------------------------------------------------------------------------
if __name__ == "__main__":
    print("\n********************** PROGRAM IS RUNNING **********************")
    print(f"********************** {'[:VIM_EVAL:]expand("%p")[:END_EVAL:]':^18} **********************\n")
    print("Press CTRL-C to end the program.\n")

    main()

    print("\n********************** PROGRAM TERMINATED **********************\n")

