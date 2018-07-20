# Command line, anybody?

We're Windows people. We love the GUI. We don't use the boring plain window with grey text. All that is so yesterday, aye? We are more used to moving the mouse, clicking at places, and then touch the keyboard only when we have something to type. We love that experience, be it Aero&trade; effect, or some other sassy visuals. Command line, again, is so yesterday.

Fair? Perhaps. Efficient?

> The console is your friend.

We're IT folks. We're engineers. We care about efficiency. I do, and I'm sure most of you do. I mean, think about it: the time taken by you to copy-paste the file names of files in a certain directory can be used to get a cup of coffee, if you could offload it to something more efficient, don't you think? (No \*nix jabs, please!) Literally speaking, PowerShell can do the task of listing out all the file names in a certain directory and put the content in your clipboard in a matter of three seconds (including the time taken to write the command). Compare that with `Right-click`, look for `Rename`, click on `Rename` to get the file name selected, `Right-click` again and select `Copy`. Take the pointer to the task bar, click on the icon for the file... OK, I'm tired already. A better way? Let's say you do a `cd C:\Users\AwesomeMan` in your PowerShell console, and you want to list out all the contents in that folder.

```powershell
Get-ChildItem | select Name | clip
```

Less than three seconds. Seriously, try it! All you have to do now is go to where you wanted the file names to be pasted (email, perhaps), and press `Ctrl+V`.

My point is, the console is our friend. And friends, we embrace. Embrace the console, give it a shot. You'll get addicted to the efficiency and the speed.

It's now time to download Windows PowerShell.

It will ask you for a restart, so be prepared. Once it's done, you're all set to follow this blog. If you'd like to get updates very time a post is added, follow me on Facebook.
Basics of Windows

Among all the jazz of ClearType fonts and graphics, we often take for granted what is actually some serious task&mdash;running the hardware of a computer. Ever wondered how different the actual working of a computer is, compared to what we see on the screen? In reality, it's overwhelmingly difficult to imagine how computers work, especially today. It's hard to believe that two voltage-based states of a bunch of transistors and gates are able to show to us what we see on the screen. These things finish off some tasks in seconds, that humans would usually take anywhere from a few minutes to several days to accomplish.

To try to fathom what happens inside a computer (and this is of some importance), let's go back to the days of DOS. As we all know from common sense today, a computer is nothing but a bunch of hardware which runs some software to get work done. But how the software talks to the hardware is something that we need to know.

Imagine the operating system (the piece of software which runs a computer) to be made of two primary layers:

- The kernel
- The shell

In simple terms, the kernel talks to the hardware, and is responsible for all the interactions the operating system has with the hardware. The shell, on the other hand, is responsible for interactions with the user. So this is how a computer should look like, in general:

- User
- Shell
- OS libraries
- Kernel
- Hardware

So there's the hardware. Then, there's the kernel that is the mediator between the hardware and the shell. And then there's the shell, which is the mediator between the kernel and the user.

In the interest of simplicity of the interface, Microsoft, for one, made things in such a way that applications sat on top of the shell, and the applications interacted with the users. A few examples for these applications would be simple things like `ping` and `telnet`, and more complex things such as `Adobe Photoshop`. So the shell was not really exposed to the user. There was the shell, the command line interface (or CLI) tools. When the GUI was made, the GUI sat along with the CLI.

If my memory is right, DOS booted up this way:

- The hardware was powered on, and the Basic Input Output System (BIOS) ran Power-On Self-Test (POST)
- Once POST was complete, the BIOS looked for an operating system at the first sector of the first track of the first disk
- If an OS entry was found, BIOS started loading the OS
  - First, a file called `io.sys` was loaded onto the RAM
  - Then, `msdos.sys` was loaded
  - The file, `command.com` was loaded onto the RAM
- BIOS relinquished control to MS-DOS, and the computer was ready for operation.

While I'm not entirely sure of this, this does seem like the same sequence of kernel, shell, and the CLI.

The problem was that the applications that were built to run on top of the CLI had access only to the CLI. They had to talk to the CLI, the CLI then spoke to the shell, which in turn spoke to the kernel, which then spoke to the hardware. Whew!

Now think of it as a game of Chinese Whispers. Funny, right?

So there were problems with this approach, in that the output was not always usable for programming. The efficiency dropped significantly, and calling the classes within the internal framework was more than challenging.

The post is quite long for a read. Let's give ourselves a break here, and resume in the next post.
Enter PowerShell

In the last post, we spoke about how it was a challenge to get data using the CLI, for programmatic use. It was a challenge, but the concept was not bad. After all, computers started off being commanded using the text interface. The CLI, though, got some job done, of course. There are more than a boatload of applications that can run purely from the command line. But there were challenges:

- Too much to remember
- Not exactly systematic or uniform
- Getting help seemed like juvenile text chat (use of `/?`)
- Not-very-useful plain text output

Overall, the Windows CLI had started to seem like a big mess people could not handle anymore. Aside from the security issues that were a weakness with Windows, Microsoft now had more reasons to go for a paradigm shift. In 2006, they finally unveiled the first version of what is today, one of the best things Microsoft ever created: Windows PowerShell. They made it available for Windows XP starting Service Pack 3, and Windows Vista. Windows 7 and all subsequent versions of Windows shipped with PowerShell.

PowerShell managed to address all of the aforementioned problems. Also, PowerShell sat a level closer to the hardware. PowerShell is an extension of the Windows shell itself; it sits right on top of the .NET libraries. More on that later.

Apart from the proximity to the libraries, here's why PowerShell is awesome on Windows:

### Remember less, use logic

PowerShell sounds like English. When we need water, we say, "Could you please *get* me some *water*?" Notice the verb, the noun, and the sequence in which they're placed. If PowerShell ever got the capability of getting water, the command (or cmdlet&mdash;pronounce: command-let) would be, `Get-Water`. This way, we need to *remember less*. So if I want a list of processes running on my PC, I would just have to say, `Get-Process`. Can it get any simpler?

### Systematic commands

With PowerShell, Microsoft (and the community) introduced the concept of *Approved Verbs* (type in `Get-Verb` in the PowerShell window), wherein, you have to choose from a predefined set of verbs to create your cmdlets in PowerShell. So if I wanted PowerShell to get me some water, I could only say, `Get-Water`, and never `Bring-Water`. It's just about a little foresight: this way, the first point would be reinforced.

### Finding commands simplified

That's right. Now if you want to get a command that kind of, say, sets the date, I can find my command either using the verb or the noun:

```powershell
Get-Command -Noun 'Date'
```

Or you could write this to be more specific

```powershell
Get-Command -Verb 'Set' -Noun 'Date'
```

Or you could simply take a guess and say,

```powershell
Get-Command -Name 'Get-Date'
```

Try it out! Experiment. Since the article is about 500 words, let's call it a day. We'll meet tomorrow to know more.
Sense, sensibility and flexibility

Yesterday. The reason I'm asking for the upgrade is that some of the things I'm going to post in the future will depend on PowerShell 3.0. The link given is for version 5.0. If you feel that you may already be on a version higher than 3.0, then run the following command to ensure you are.

```powershell
$PsVersionTable
```

Look for the value for `PSVersion`. If it is higher than 3.0, it's not *necessary* that you upgrade PowerShell on your computer, although, I would recommend the upgrade. What's there to lose, it's free!

Coming back to sensibility, the output that PowerShell gives you is more sensible, and... *computable*.

What makes it better is that if something isn't sensible right away, you can *make it sensible*. For example, run the following command:

```powershell
Get-ChildItem
```

You see a column called `Length`. It wouldn't make sense to some people right off the bat. While it just means "size", people who are not very familiar with the technical terminology would not understand it at the first shot. The fix? Just use *Calculated Properties*!

Here:

```powershell
Get-ChildItem | Select-Object Name, @{Name="Size(MB)";Expression={$_.Length / 1MB}}
```

Did you run that? No? Please open the console and run it.

Cool, right? Calculated properties are nothing but values that are _manipulated_. You can simply tell PowerShell that you want the column renamed as "Size(MB)". As long as the name is in quotes, you can have spaces if you want, but I'd recommend against it. You'll understand when we start referring to specific properties from the output. We'll talk about it in more detail then.

### Easier help

Before we wind up for the day, let's look at how getting help is no more juvenile talk, but a pleasant experience. When you want to get some help, all you say is... That's right, `Get-Help`! When you need help with the command to fetch the services running on your PC, you would simply say,

```powershell
Get-Command -Verb 'Get' -Noun '*service*'

Get-Help Get-Service

Get-Help Get-Service -Full

Get-Help Get-Service -Examples
```


Try out those commands. Get your hands dirty in PowerShell. There's something called as muscle memory; it's what helps you type, without having to constantly look at the keyboard, also, how we type `Get-Help` instead of `Get Help`. Type the commands. Go on. Let's meet up again tomorrow!

# Familiarising the windows

We saw some cool stuff in the past couple of posts on PowerShell. Some of us probably even found it ironic that there were certain things in the commands given in the post, which did not make much sense, while everything in PowerShell *should* have made sense.

Worry not. We're on the next step of our PowerShell journey.

Before we proceed, we need to know a few things about PowerShell, and how to use it. So let's simply talk about the different PowerShell consoles we have, and which one to use when.

In general, I'd say, there's no hard and fast rule that only a certain type of console can be used in a certain situation. It's a matter of convenience, personal preferences and popular choices. And popular choices, when it comes to tech stuff, are usually good choices in general. No, please, no, this is not the time to talk about how Androids are highly popular but not necessarily a good choice. There are various factors there. And it's a never-ending debate.

Back to using PowerShell. Technically speaking, if you're running a 64-bit (x64) computer, there are eight different kinds of PowerShell windows. If you're running a 32-bit (x86) computer, there are four.

* The Console
  * Windows PowerShell
  * Windows PowerShell (x86)
  * The administrator] window for both
* The Integrated Scripting Environment (ISE)
  * Windows PowerShell ISE
  * Windows PowerShell ISE (x86)
  * The administrator] window for both

Please note that on x86 computers, there would be no Windows PowerShell (x86) because their PowerShell would anyway be x86, eliminating the need for another x86-type window. x64 computers, on the other hand, have x64 windows by default, and can launch an x86 window if needed, although, I can't think of a practical reason to do it.

### The console

The console seems very similar to the command prompt window. This does not have much options. This window is a lightweight one, and is used when you have to run commands line-by-line, just to fetch some basic information (or, like, restart your computer through command). When you hit the `Enter` key after a command, the command executes (duh, right?), and if you want to go to the next line without running the command, you have to do a `Shift+Enter`. So, as I said, this is used primarily to run commands, and not write scripts. In this window, you enter the command, and the output appears right below the command.

The window colours are a little different from the command prompt to give us a visual cue that this is a PowerShell window. Although, it's worth noting that most `cmd` commands run on the PowerShell console. Some options and the way the arguments are passed may differ in cases where the command itself is an alias to an underlying PowerShell cmdlet.

Whoa, whoa, hold on! What did you say? What alias?

Don't worry about it. I'll remember to talk about this in the very next post, if possible. For now, just remember that most of CMD commands can run on PowerShell.

### The Integrated Scripting Environment

The PowerShell ISE, as its name suggests, is a scripting-and-debugging environment. This is heavier compared to the PowerShell command console. The ISE is feature-rich, with Intellisense&trade;, command pane showing you all available commands, add-ons and things like that.

The older versions of PowerShell ISE had three sections where action happened:

* The script pane, where we wrote scripts
* The output pane, where the output was shown
* The command pane, which was the same as the command console

Today's PowerShell ISE combines the second and the third panes into one. So we have only the script pane and the console. Again, the console is used to run commands by hitting the `Enter` key, and viewing output. The scripting pane is to write PowerShell scripts. Here, hitting `Enter` just takes you to the next line. You have to run the script by hitting the `Run` key, and you can then break into the debugger to debug your scripts and all.

As you can see, this is a more advanced way of using PowerShell&mdash;in fact, I'd daresay that this is *the* way to use PowerShell! But of course, if I just want to run `Restart-Computer`, I wouldn't launch a session of ISE. By the time it loads, the computer restart could begin, if done through the console.

> Did you know that you can convert a CMD window to a PowerShell command window? Open CMD, type in `PowerShell` and hit `Enter`. Notice the prompt change!

That's all for today! Play around with the console and get used to how it looks and all. As a bonus, if you're into code highlight themes and all, check out this repository of PowerShell ISE themes. Enjoy!

