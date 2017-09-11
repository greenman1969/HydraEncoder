List of Files and Functions
	Encode.bash: Single-threaded encoder and base for this project.
	Hydra.bash: Multi-threaded script that calls the single threaded encoder.
	Head.bash: The single threaded encoder that is called by Hydra.bash

Usage (Encode.bash): ./Encode.bash [Source] [Destination] [Bitrate in Kbps]
Usage (Hydra.bash): ./Hydra.bash [Source] [Destination] [Bitrate in Kbps] [# Threads]
Usage (Head.bash): ./Head.bash [Source] [Destination] [Bitrate in kbps] [String Regex]
