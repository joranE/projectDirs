
<!-- README.md is generated from README.Rmd. Please edit that file -->

# projectDirs

projectDirs is an RStudio Addin that allows you to create a configurable
set of folders (directories) in an RStudio project. Additionally, it
provides a way to move an existing set of files into these folders based
on either their extensions or using regular expressions on the file
names.

## Installation

You can install the released version of projectDirs from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("joranE/projectDirs")
```

## Usage

It is often desirable to use a consistent directory structure for your
RStudio projects. After installing projectDirs, a command “Create
Project Directories” will be added to the Addins drop-down menu in
RStudio. The default set of folders created are “r”, “data” and
“figures”, but this can be configured by setting the
`projdirs.folders` option in your `.Rprofile`:

``` r
# Put this in your .Rprofile
options(projdirs.folders = c("r","input","output","plots","cache"))
```

The above example will create folders with those names at the top level
of the current project.

Often we create an RStudio project around a pre-existing set of files
that need to be moved into the resulting directory structure.
projectDirs also provides the Addin command “Place Files By Extension”
that will move files at the top level of the project into folders based
on their file extension. This is configurable via a named list in
`options()`.

For example, setting:

``` r
# Put this in your .Rprofile
options(projdirs.file_ext_map = list(r = c("r","R"),data = c("csv","tsv","txt")))
```

will move files with the extensions “r” and “R” into the folder “r” and
files with the extensions “csv”, “tsv” and “txt” into the folder “data”.
If folders by these do not exist, no action is taken for that rule.

Finally, we can also move files into directories based on regular
expressions on the entire file names with the Addin command “Place Files
By Regex”. For example, the above mapping could also be done via:

``` r
# Put this in your .Rprofile
options(projdirs.file_regex = list(r = "r$|R$",data = "csv$|tsv$|txt$"))
```

Once again, if no folder “r” or “data” exists that rule is skipped.
