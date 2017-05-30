## Test environments
* local OS X install, R 3.3.2
* ubuntu 12.04 (on travis-ci), R 3.3.2
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 2 notes

* Checking installed package size:
  installed size is 20.9Mb
  sub-directories of 1Mb or more:
    data  20.6Mb
* Checking top-level files:
  Non-standard file/directory found at top level:
  ‘raw_data’

This is a data package that will be rarely updated. The `raw_data` folder only contains code used to clean and tidy the source data.

## Reverse dependencies

* I have run R CMD check on the 5 downstream dependencies.
  (Summary at https://github.com/alspur/kysrc/tree/master/revdep).

* All passed with no errors or warnings.
