Scripts nautilus.
==========================================================================================

A nautilus script is an executable shell script that is placed in a special scripts directory so that the Nautilus graphical shell can find it. This allows you to extend the functionality the the file browser to do just about anything.

Scripts are invoked by selecting a file or group of files, and right-clicking with the mouse, to bring up a context menu. One of the options in this menu is the 'Scripts' submenu, which allows you to select a script to invoke on the selected files.

Note: The submenu 'Scripts' only appears once you have at least one script in the scripts directory.

For a script to be found by Nautilus it needs to be located in your scripts directory (~/.gnome2/nautilus-scripts). This folder is located in your home folder but is hidden by default. To view hidden files and folders in Nautilus press Ctrl+H, or use the terminal to navigate to the folder:

	cd ~/.gnome2/nautilus-scripts

Note: Once you place a script in your scripts directory, it's name will not necessarily appear in the scripts menu immediately. You might have to visit the scripts directory with Nautilus - which can be done using the last option in the scripts menu. Once the directory is visited, Nautilus will know about which scripts you have, and you will be able to use them.

For scripts to be usable they need to be marked as executable. To make a script executable either right-click a script and select 'Properties → Permissions → Allow executing file as program' or use the following command in the terminal:

	chmod +x name-of-script


Making a script
====================================================

To write a script you need to be familiar with a scripting language. The easiest way to create a script is using Bash, but for more complicated task you might need to use other launguages such as Perl or Python.

Whenever a script is called, Nautilus automatically sets a handful of variables that can be used in your scripts.

 - **NAUTILUS\_SCRIPT\_SELECTED\_FILE\_PATHS**
   - newline-delimited paths for selected files (only if local) 
 - **NAUTILUS\_SCRIPT\_SELECTED\_URIS**
   - newline-delimited URIs for selected files 
 - **NAUTILUS\_SCRIPT\_CURRENT\_URI**
   - current location 
 - **NAUTILUS\_SCRIPT\_WINDOW\_GEOMETRY**
   - position and size of current window 

To see samples of scripts click here.


Sample scripts
===================================

### Email the selected file


This one is really useful. How many times have you needed to find a file and then send it? And to be honest, from Evolution or mozilla-thunderbird this is not that simple. It is much easier to use Nautilus to find your file and then send it from there.

	#!/usr/bin/perl -w
    # By John Russell

    # This script sends the selected file(s) with your email client.

    use strict;

    my $MAILTO_URL="mailto:?";
    my @files = split("\n", $ENV{NAUTILUS_SCRIPT_SELECTED_FILE_PATHS});
    my $count = 0;
    foreach my $file (@files)
    {
        if ( ! -f $file && ! -l $file )
        {
            my @dialog = ("gdialog","--title","Error","--msgbox", "\nError: Can not send $file.    \n\n    Only regular files can be mailed.    ","200", "300");
            system (@dialog);
        }
        else
        {
           $MAILTO_URL = $MAILTO_URL . "attach=" . $file . "&";
               shift;
            $count += 1;
        }
    }


    if ($count > 0)
    {
        my @command = ("gnome-open", $MAILTO_URL);
        system(@command);
    }


Added by Darrell: I found that the mailto: syntax in the above does not work with mozilla-thunderbird. I have created the following amended version which seems to work with Thunderbird: 


	#!/usr/bin/perl -w
    # By John Russell
    # and hacked to work with thunderbird by Darrell

    # This script sends the selected file(s) with mozilla-thunderbird.

    use strict;

    my $attach_string="\"attachment='";
    my @files = split("\n", $ENV{NAUTILUS_SCRIPT_SELECTED_FILE_PATHS});
    my $count = 0;
    foreach my $file (@files)
    {
        if ( ! -f $file && ! -l $file )
        {
            my @dialog = ("gdialog","--title","Error","--msgbox", "\nError: Can not send $file. \n\n    Only regular files can be mailed.    ","200", "300");
            system (@dialog);
        }
        else
        {
           $attach_string = $attach_string . "file://" . $file . ",";
               shift;
            $count += 1;
        }
    }


    if ($count > 0)
    {
        $attach_string = $attach_string . "'\"";
    # replace spaces with '%20' as demanded by mozilla/thunderbird    
        $attach_string =~ s/\s/%20/g;
    # invoke shell script to call thunderbird differently depending on whether it's running already or not
        my $command = ("~/scripts/thunderbird-email-attachments " . $attach_string);
        system($command);
    }


You will see there is also a shell script which is required, (~/scripts/thunderbird-email-attachments in my example above, don't put it in the nautilus-scripts directory, otherwise it will show up in the context menu)

	#!/bin/sh
    # if thunderbird is already running open a compose window in the running instance

            if `ps xc | grep -q mozilla-thunder`; then 
                    exec mozilla-thunderbird -a Mozilla-Thunderbird -remote         "xfeDoCommand(ComposeMessage,$1)"

    # else start a new instance with the compose window only

            else
                    exec mozilla-thunderbird -compose $1 
            fi


###Mount ISO

Mount an ISO image, from Nautilus. Note from carney1979 - this script will be updated to work with filenames containing spaces soon. 

	#!/bin/bash
    #
    #By modprobing loop it makes sure that the module is loaded and ready for 
    #use.  If it is already loaded then nothing will happen.
    modprobe loop
    for I in `echo $*`
    do
       foo=`gksudo -u root -k -m "enter your password for root terminal access" /bin/echo "got r00t?"`
    sudo mount -o loop -t iso9660 $I /media/iso
       done
    done
    exit0

###Unmount ISO

Unmount an iso image, from nautilus. Note from carney1979 - this script will be updated to work with filenames containing spaces soon. 

	#!/bin/bash
    #
    for I in `echo $*`
    do
       foo=`gksudo -u root -k -m "enter your password for root terminal access" /bin/echo "got r00t?"`
    sudo umount $I
      done
    done
    exit0

###Set file read-only

Change file-permission to read-only. 

	#!/bin/bash
    chmod ugo-wx $*

###Edit file with gedit with root-privileges

Note from carney1979 - this script will be updated to work with filenames containing spaces soon. 

	#!/bin/bash
    #
    for I in `echo $*`
    do
       foo=`gksudo -u root -k -m "enter your password for root terminal access" /bin/echo "got r00t?"`
    sudo gedit $I
       done
    done
    exit0

Note from blazoner - A much simpler alternative that works with filenames containing spaces is: 

	#!/bin/sh
    gksudo "gedit $NAUTILUS_SCRIPT_SELECTED_URIS"

###Open Nautilus with root-privileges here

	#!/bin/bash
    # root-nautilus-here
    # opens a root-enabled instance of a nautilus window in selected location
    # requires sudo privileges and gksudo, which may involve security risks.
    #Install in your ~/Nautilus/scripts directory.
    #
    # Placed in the public domain by Shane T. Mueller 2001
    # Fixes provided by Doug Nordwall
    #
    # 2004.04.18 -- keith@penguingurus.com - Added gksudo usage to provide popup
    #               password window if sudo has expired.  Line only echos got
    #               root to std output.  But gksudo updates your sudo access
    #               privs, so running nautilus with sudo will succeed
    #               without asking for a password.
    
    
    foo=`gksudo -u root -k -m "enter your password for nautilus root access" /bin/echo "got r00t?"`
    sudo nautilus --no-desktop $NAUTILUS_SCRIPT_CURRENT_URI

Note from blazoner - A much simpler alternative: 

	#!/bin/sh
    ### root-nautilus-here
    gksudo "nautilus --no-desktop $NAUTILUS_SCRIPT_CURRENT_URI"


###Run file with root privileges

	#!/bin/bash
    #
    for I in `echo $*`
    do
       /usr/bin/gksudo $I
       done
    done
    exit0


###Open search window here

	#!/bin/sh
    # From Johnathan Bailes
    # This script opens a gnome-search-tool in the directory you select.
    #
    # Distributed under the terms of GNU GPL version 2 or later
    #
    # Install in your ~/Nautilus/scripts directory.
    # You need to be running Nautilus 1.0.3+ to use scripts.
    
    cd $NAUTILUS_SCRIPT_CURRENT_URI
    exec gnome-search-tool

### Open terminal here

	#!/bin/bash
    #
    # This script opens a gnome-terminal in the directory you select.
    #
    # Distributed under the terms of GNU GPL version 2 or later
    #
    # Install in ~/.gnome2/nautilus-scripts or ~/Nautilus/scripts
    # You need to be running Nautilus 1.0.3+ to use scripts.
    
    # When a directory is selected, go there. Otherwise go to current
    # directory. If more than one directory is selected, show error.
    if [ -n "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" ]; then
        set $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS
        if [ $# -eq 1 ]; then
            destination="$1"
            # Go to file's directory if it's a file
            if [ ! -d "$destination" ]; then
                destination="`dirname "$destination"`"
            fi
        else
            zenity --error --title="Error - Open terminal here" \
               --text="You can only select one directory."
            exit 1
        fi
    else
        destination="`echo "$NAUTILUS_SCRIPT_CURRENT_URI" | sed 's/^file:\/\///'`"
    fi
    
    # It's only possible to go to local directories
    if [ -n "`echo "$destination" | grep '^[a-zA-Z0-9]\+:'`" ]; then
        zenity --error --title="Error - Open terminal here" \
           --text="Only local directories can be used."
        exit 1
    fi
    
    cd "$destination"
    exec x-terminal-emulator

###Hide or Show Hidden Files

	#!/bin/sh
    # When hidden files (.emacs, etc) are hidden, shows "Show Hidden Files" option.
    # When hidden files are shown, shows "Hide Hidden Files" option.
    # Uses gconf to toggle between the two Nautilus options.
    # Should be placed in ~/.gnome2/nautilus-scripts/ with executable permission.
    OLDSTATE=$(gconftool-2 --get "/desktop/gnome/file_views/show_hidden_files")
    if [ "$OLDSTATE" == "false" ] ; then
      NEWSTATE="True"
      mv ~/.gnome2/nautilus-scripts/Show\ Dot\ Files ~/.gnome2/nautilus-scripts/Hide\ Dot\ Files
    else
      NEWSTATE="False"
      mv ~/.gnome2/nautilus-scripts/Hide\ Dot\ Files ~/.gnome2/nautilus-scripts/Show\ Dot\ Files
    fi
    gconftool-2 --set "/desktop/gnome/file_views/show_hidden_files" --type boolean $NEWSTATE

**Note:** You can do the same without a script by pressing CTRL+H under Nautilus 

### SCP a file or directory to a remote host

This script allows you to scp a file or directory to a static list of remote hosts.

NOTE: you must have ssh key based authorization previously setup and have created a file that lists the hosts ip or fqdn separated by newlines. 

	  #!/bin/bash
	  #scp_to -- nautilus script that scp's files to a fixed list of hosts in a file
	  #created by Brad Smith (bradleydsmith@gmail.com) 
	  #NEED: zenity, ssh key based auth, host file under ~/.scp_hosts(or call it whatever you like)
	  #Install in ~/.gnome2/nautilus-scripts

	  #CONSTANTS
	  HOSTS='$HOME/.scp_hosts'
	  FILEPATH=`echo $NAUTILUS_SCRIPT_SELECTED_URIS | sed 's@file://@@g'`
	  SCP='/usr/bin/scp'
	  SSH_ID="$HOME/.ssh/id_rsa.pub" #make sure you are using ssh keys or this is a waste of time
	  ZENITY='/usr/bin/zenity '
	  #ZENITY_PROGRESS_OPTIONS='--auto-close --auto-kill' #you can remove this if you like

	  #sanity checks
	  for sanity_check in $HOSTS $ZENITY $SSH_ID $SCP $FILEPATH
		do
		   ZENITY_ERROR_SANITY="There is an error, it involved $sanity_check.\n Probably binary or file missing" 
		   if [ ! -e $sanity_check ]
			 then 
			  #zenity --error --text="$(eval "echo \"$ZENITY_ERROR_SANITY\"")"
			  zenity --error --text="$ZENITY_ERROR_SANITY"
			 exit 
		  fi
	  done


	  #check whether copying file or directory
	  if [ -d "$FILEPATH" ]; then
			SCP="$SCP -r "
	  fi

	  #pick host to copy to
	  RESULT=`cat $HOSTS | zenity --list --title "SCP HOSTS" --text "Pick a host.." --column "HOSTS"`
	  #TODO needs a better check if user clicked cancel on list--dont want any artifacts left over for   failed scp command
	  if [ $? -ne 0 ]
	   then
	   exit
	  fi

	  #PASSEd ALL CHECKS; heavy lifting
	  $SCP $FILEPATH $RESULT: | $($ZENITY --progress --text="copying $(basename $FILEPATH)" --pulsate   $ZENITY_PROGRESS_OPTIONS) 
	  if [ $? -eq 0 ]
	   then
		zenity --info --text="SCP Succeeded!"
	  else
		zenity --error --text="SCP failed to $RESULT"
		exit
	fi


##Ligas

 - <https://help.ubuntu.com/community/NautilusScriptsHowto>  - NautilusScriptsHowto
 - <http://g-scripts.sourceforge.net/> - More information about Nautilus scripts
 - <http://mundogeek.net/nautilus-scripts/> - A collection of Nautilus scripts


