# Minimal Node.js app

A small HTTP server for practicing how to build and run a Node.js application on an Ubuntu VM.

## Build and run on an Ubuntu VM

1. Connect to the VM over SSH and make sure Node.js 18 or newer is installed:

	```bash
	node --version
	npm --version
	```

	If Node.js is not installed, install it with the VM's package manager or use
	the official Node.js installation instructions. The application requires
	Node.js 18 or newer.

2. Copy or clone this repository onto the VM, then enter the project directory:

	```bash
	cd devops-morning730
	```

3. Install the application dependencies:

	```bash
	npm install
	```

	This project does not currently have a separate compilation step. Installing
	the dependencies is the complete build step.

4. Start the application:

	```bash
	npm start
	```

	The server listens on port `3000` and binds to all VM interfaces. In another
	SSH session, verify it from inside the VM:

	```bash
	curl http://localhost:3000
	```

	To access it from your computer, allow TCP port `3000` in the VM firewall
	and any cloud security-group or network rules, then visit:

	```text
	http://<VM_PUBLIC_IP>:3000
	```

	Press `Ctrl+C` to stop the server.

### Run after disconnecting from SSH

To keep the app running after closing the SSH session, start it in the
background and write its output to a log file:

```bash
nohup npm start > app.log 2>&1 &
```

Check the process and logs with:

```bash
ps aux | grep '[n]ode server.js'
tail -f app.log
```

## Run locally

Install Node.js 18 or newer, then run:

```bash
npm start
```

The app listens on port `3000` by default. Visit `http://localhost:3000` or test it with:

```bash
curl http://localhost:3000
```

To use a different port:

```bash
PORT=8080 npm start
```
