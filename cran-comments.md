## Test environments
## R CMD check results

0 errors | 0 warnings | 1 note

Maintainer: ‘Ayla Pearson <ayla@poissonconsulting.ca>’
   
   New maintainer:
     Ayla Pearson <ayla@poissonconsulting.ca>
   Old maintainer(s):
     Joe Thorley <joe@poissonconsulting.ca>

## revdepcheck results

We checked 2 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 1 new problems
 * We failed to check 0 packages

✔ ypr 0.6.0.9011                         ── E: 0     | W: 0     | N: 0                                                                    
✖ fwatlasbc 0.0.1.9018                   ── E: 2     | W: 0     | N: 1-1+1                                                                

The fwatlasbc package is a non-CRAN package. 
In reviewing the GitHub actions for this package it appears it has been broken for several months and is not related to the changes in tidyplus.
