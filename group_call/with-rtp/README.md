# Requirments
In order to run test successfully you should install `sipp` with all optional 
features and `ffmpeg`.

## Building SIPp
- clone SIPp
- in the root directory, `./build.sh --full`
- `make` and `make install`

# Running Test
Just run the `./runner.sh` script.

# Verification
After running the `./runner.sh` two new `.wav` files should be created in the
current directory, the name of new files are `mcptt_02.wav` and `mcptt_03.wav`.
The content of these new files should be identical to `file.wav`. You can 
verify this by playing these files with `ffplay <file_name>`.

