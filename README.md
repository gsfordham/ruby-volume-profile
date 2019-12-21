# ruby-volume-profile

**INTRO**

This is a Ruby script for GNU+Linux, that calls Bash commands, to set the default sound profile on your card (b/c it seems that the default profile settings don't always stick, especially after package upgrades...).

**REQUIREMENTS**
1) Ruby
1) GNU+Linux OS

**QUICK NOTE ON MOTHERBOARDS**

If you have an MSI B450 Tomahawk and want 7.1 output + stereo input, you should be able to leave it as-is, so long as all your audio cables are plugged in correctly.

Otherwise, Set the ``want`` and ``profile`` variables to whatever they are supposed to be for your desired configuration.

**PACMD INFO**

This script uses Ruby to call some Bash commands, mainly b/c I like working in Ruby. However, you need not use Ruby, if you wish, and you can extract the relevant parts.

The ``pacmd`` command will look like: ``pacmd set-card-profile [index] [profile]``.

Annoyingly, it seems ridiculous that ***NO ONE*** seems to put a *full example* of how this will look, when **filled in**, so here's an **EXAMPLE** command, using my own configuration: ``pacmd set-card-profile 3 output:analog-surround-71+input:analog-stereo``.

As you can see by this, the ``pacmd`` command takes the command argument ``set-card-profile``, the card/index argument ``[some numeric index value, as defined by the 'pacmd list-cards' command]``, and a "profile name" argument of ``output:[some output profile name]`` and optional ``+input:[some input profile name]``.

Examples online use unfilled example inputs, and they tend to use angle brackets (``<>``), but the ``pacmd list-cards`` command *ALSO* uses angle brackets in the "names". You do ***NOT*** put angle brackets in the name, and the card is ***JUST*** the index ***NUMBER***.

I'm sure I'm not the only one who misinterpreted this syntax, and I do ***NOT*** know why this does not seem to appear anywhere; it was a real pain to find the proper syntax for it, so hopefully that alone helps you, even if you don't use my Ruby configurator for it.

**TO DO**
1) Should probably add a ``set-default-sink`` option in there, in case your system constantly changes the default sound sink
1) Might add command-line arguments
1) Might add ``ENVT_VARIABLE`` options
