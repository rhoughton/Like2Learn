Not sure what I'll focus on so titled this todays date

What type of file is in /proc/[PID]/maps?
--a kernel generated file

What's the last step in compiling a program?
--linking! 

What 2 types of object files exist? 
--relocatable or executable

What extension do each of them use?
-- .o for object file (exe) and .so for the "relocatable" Shared Object file, in Win though these are DLLs

What does the linker do with the symbols... what are symbols?
--symbols are functions & variables, the linker puts them in the  "symbol table" of the exe next to their mem addr. 

Why does a compiler "relocate" your code?
--to improve performance 

What are PEs (portable executables?)
-- .exe & .dll 

What's an ELF? 
-- exe & linkable file which often is a .bin

What does a loader do?
--copies the linkers output to memory

We say... instead of linking files during compile time, linking is done at runtime. 

dynamic linking and loading are often done together 

What's a benefit of dynamic loading?
--use less mmeory, b/c libraries are only loaded when/if your program needs them. 

DEX
APK

Can android apps load executables?
--no

What does the s or p stand for in the permissions column? (we all know r/w/x)
--shared or private 

Apps have home directories?
--yes 

Where?
--data/data

Where can an app load a DEX file? 
--data/data 

https://sayfer.io/blog/dynamic-loading-in-android-applications-with-proc-maps/ 