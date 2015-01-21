#! /usr/bin/env python2

import sys, math

def calculatedpi():
    hres = float(sys.argv[1])
    vres = float(sys.argv[2])
    dsize = float(sys.argv[3])
    dpi = hres / (hres / math.sqrt(hres**2 + vres**2) * dsize)
    print "Your screen's dpi =", int(dpi)
    print ""

def main():
    argerror = False
    if len(sys.argv) < 4:
        argerror = True
    else:
        for arg in sys.argv[1:]:
            if arg.isdigit() == False:
                argerror = True
    if argerror == True:
        print "DPI calculator"
        print "Usage: dpi hres vres size"
        print "Where:"
        print "  hres = horizontal resolution in pixels"
        print "  vres = vertical resolution in pixels"
        print "  size = size of screen in inches"
        print "Example:"
        print "  dpi 1280 1024 19"
        print "  Your screen's dpi = 86"
        print ""
    else:
        calculatedpi()

if __name__ == "__main__":
    main()