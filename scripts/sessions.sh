#! /usr/bin/bash
clear;

PS3="Choose a session: ";
choices="i3 Gnome";

echo "Choose a session to start:"
echo
select session in $choices Exit
do
  case $session in
    i3)
      export SESSION_CHOICE="i3";
      break;
      ;;
    Gnome)
      export XDG_SESSION_TYPE=x11
      export GDK_BACKEND=x11
      export SESSION_CHOICE="gnome-session";
      break;
      ;;
    Exit)
      echo "Bye";
      break;
      ;;
    *)
      echo "Invalid selection";
      ;;
  esac
done

if [[ "$choices" == *"$session"* ]]; then
  startx
fi
