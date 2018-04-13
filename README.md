List of Files and Functions
	Encode.bash: Single-threaded encoder and base for this project. (Do Not Use: The regular expressions are unstable!)
	Hydra.bash: Multi-threaded script that calls the single threaded encoder.
	Head.bash: The single threaded encoder that is called by Hydra.bash

Usage (Encode.bash): ./Encode.bash [Source] [Destination] [Bitrate in Kbps]
Usage (Hydra.bash): ./Hydra.bash [Music Directory: Omit Trailing /] [Output Directory: Omit Trailing /] [Bitrate in kbs] [Number of Workers: 1-8,12]
Usage (Head.bash): ./Head.bash [Music Directory: Omit trailing /] [Output Directory: omit trailing /] [Bitrate in kbs] [File listing files]
