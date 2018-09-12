# Working with scripts and functions

Scripts are arguably the primary mode of automation using PowerShell. And just like with Bash or Zsh, a PowerShell script is nothing but a series of instructions, along with some much-required branching and looping. The pipeline makes handling data very simple from the moment you understand the concept of objects---this is the difference between the scripting framework available in Linux.

In this chapter, we will proceed with creating scripts that accept input at the terminal. Then, we will learn to create functions, in order to leverage the modularity as well as transfer of objects between your functions and other functions or even cmdlets.

# Writing a simple script

In a way, the book itself began with a script: the lab setup script. This recipe is here to show you that a simple script is nothing more than a series of commands put together. Now, we have been writing scripts throughout this book. However, some of the information may have been scattered across different chapters and recipes. In this recipe, we bring it all together and write a simple script. Also, given the cookbook structure of the book, it is important we cover this topic, for those who skipped straight to this point.

The scenario here is that you have to write a script that will give out the current date and time, and show the host name of the computer the script is running on. It also welcomes the user by his username. The catch here is that you need to have a space in the name of the script, and you need to ensure that the script should be called in a platform-agnostic manner.

## How to do it

The requirements are simple. Three things are required of us:

1. The script must have a name that contains a space.
2. Write out the current date and time.
3. Show the host name.
4. Greet the user by their username.

Create a file called `simple script.ps1`. Add the following content to it:

```
Get-Date

hostname

Write-Output "Hello, $env:username!"
```

Call the script:

```
& './simple script.ps1'
```

## How it works

Now to the part where this is rocket science. First, identify the payload. Calculate the orbital velocity and the rotational velocity of the Earth. Next... You get the point. However, here are a couple of things to remember when you want to run a script.

A script, when called simply, would load, execute and exit. It would not store anything in the memory---neither the functions, nor the variables and other data. If you want the variables, functions and other information retained in the session, the script has to be called in a specific way.

```
# To retain variable and function information in the session:
. ./path/to/script.ps1

# To simply have PowerShell run the script:
& ./path/to/script.ps1
```

In Bash, we simply add a backslash before the space, if there is a space in the path name. In PowerShell, especially when running a script on Windows, it will not work, because in Windows, the backslash is the path separator. The other option would be to enclose the complete path in quotes. However, by default, PowerShell considers anything enclosed in quotes as a string. Therefore, in order to tell PowerShell to read the path as the path, we use either of the call operators, `&` or `.`, based on the situation as demonstrated above.

# Reading input from the host

Admittedly, reading input given by the user at the host is not among the best things for automation. However, in some situations it is necessary. Let us not leave such stones unturned, at least. So in this recipe, we ask the user for their name, and then, display the greeting along with the date. Optionally, you can have a space in the name of the script.

## How to do it

Straightforward. If you are comfortable using the command discovery, you would simply do a `get-command *host` to get the information. Modify the script we created for Writing a simple script above, to get the desired script.

```
Get-Date

hostname

Write-Output "Hello, $(Read-Host "Enter your name")!"
# Verbose version: Write-Output "Hello, $(Read-Host -Prompt "Enter your name")!"
```

That is all it is; run the script.

```
& './simple prompt script.ps1'
```

## How it works

Read-Host takes input from the host, and then, passes on the received object to the calling function. In our case, we have the Read-Host placed within a subexpression, and the caller is the Write-Output cmdlet. Therefore, it takes in the name as the input and then passes it on to the Write-Output cmdlet.

Optionally, if you are not comfortable using a subexpression, you can assign the value to a variable, and call the variable with Write-Output:

```
$Name = Read-Host "Enter your name"
Write-Output "Hello, $Name!"
```

# Displaying an interactive menu

Many of our clients outsource their Service Desks to offshore service providers. Many of these Service Desk agents are not comfortable running commands or scripts. And some of our clients are uncomfortable providing Service Desk agents with a no-UI script. One such L1 Support team came to us with a requirement for a script to partially automate account termination backup. Most importantly, we were asked to provide the agents with a textual menu which they would interact with to start the right kind of backup (mailbox, membership, home drive, etc.)

In this recipe, we will replicate that menu, but not actually call the backup functions.

## How to do it

The requirements are simple. We will create a script that displays the following menu:

1. Mailbox backup
2. Home drive backup
3. Mailbox and home drive backup
4. Mailbox, home drive and group membership backup

Here is the script that would show this menu:

```
$Menu = @'
Hello! Welcome to the Terminated Account Backup Utility (TABU)!

1. Mailbox backup
2. Home drive backup
3. Mailbox and home drive backup
4. Mailbox, home drive and group membership backup

Choose your backup type and enter the corresponding number
'@

$Choice = Read-Host $Menu

switch ($Choice) {
    1 {
        "You chose the mailbox backup. Initiating..."
        # Call the corresponding function here.
    }
    2 {
        "You chose the home drive backup. Initiating..."
        # Call the corresponding function here.
    }
    3 {
        "You chose to back up the mailbox as well as the home drive. Initiating..."
        # Call the corresponding function here.
    }
    4 {
        "You chose a complete backup. This person must be imporant! Initiating..."
        # Call the corresponding function here.
    }
    Default {
        "Invalid selection. Please try again."
    }
}
```

## How it works

This is another of the rocket science problem which is hard to tackle. To oversimplify it, the choice is assigned to the variable, and a switch-case block is made to proceed with the task based on the branch chosen.

## See also

1. Flow control using switch-case from Flow Control using Branches and Loops