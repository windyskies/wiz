## extremely cooool wizard to run fast tests in c:

```md
# write simple tests without having to configure the original file.
# it is as simple making a to-do list
```
### Installation
```sh
$ sh install.sh
$ chmod u+x gci.sh
$ brew install gnu-sed # if you are using MacOS
```

### How to run
```sh
$ wiz water.c wiz.debug.z
```

### Usage & Examples

> a simple reference of wiz.[filename].z
```md
[#line_number] _specifier _variable_name --> syntax
     \  |  /                 ^^^^^^^^^^
       \|/       refers to the variable in your [filename].c
    ^^^^^^^^^
 #line that you want to append test script

## check the instructions from bottom if you do not know specifiers in c
```
> examples:
```md
# [make] a new file
$ touch wiz.[filename].z
# [open] wiz.[filename].z
$ nano wiz.[filename].z
# [write] test cases in "wiz.[filename].z" file
[16] d _firstvariable_ 
[19] f _secondvariable_

# [run] the following from terminal:
$ wiz filename.c wiz.filename.z
```
#### >>> to auto-run the testfiles install [gci from github <<<](https://github.com/windyskies/gci)


### Version Notes

```md
# v1 --> @default --< initial
# v1.2 --> upcoming --< new feature: [will auto-recognize wiz.#.z files]
# v1.3 --> upcoming --< new feature: [multi language support]
```

### Instructions

Use [this printf() reference](https://www.tutorialspoint.com/c_standard_library/c_function_printf.htm) for _specifiers, and [optional] further [reference for data types](https://www.tutorialspoint.com/cprogramming/c_data_types.htm).