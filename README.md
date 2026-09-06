# MYRAA AI Assistant

MYRAA is a desktop AI companion built with Electron, React, Node.js, and Python. It features a holographic anime-style UI, voice conversation, memory system, and full desktop control (open apps, browse files, control volume, take screenshots, and more).

This repo supports **two modes**:
- **Gemini API Key** — Direct Google Gemini API (full memory extraction)
- **gemini-web2api Proxy** — Free, no API key needed (uses Gemini's web interface)

---

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Setup — Option A: Gemini API Key (Paid)](#setup--option-a-gemini-api-key-paid)
- [Setup — Option B: gemini-web2api Proxy (Free)](#setup--option-b-gemini-web2api-proxy-free)
- [Running MYRAA](#running-myraa)
- [Desktop Control Agent](#desktop-control-agent)
- [Troubleshooting](#troubleshooting)

---

## Features

- **Holographic UI** — Animated anime-style holographic projector with idle/talking/thinking states
- **Voice Conversation** — Real-time voice chat with Gemini AI
- **Memory System** — AI remembers details about you across sessions (API key mode)
- **Desktop Control** — Open apps, browse files, control volume/brightness, take screenshots, automate browsers
- **52 Desktop Tools** — Full Windows automation via Python FastAPI agent
- **Electron Desktop App** — Standalone Windows application

---

## Prerequisites

| Requirement | Version | Notes |
|-------------|---------|-------|
| **Node.js** | 18+ | [Download](https://nodejs.org/) |
| **Python** | 3.11+ | [Download](https://www.python.org/downloads/) |
| **npm** | Comes with Node.js | |
| **pip** | Comes with Python | |

Optional (for proxy mode):
- **gemini-web2api** — [GitHub](https://github.com/Sophomoresty/gemini-web2api)

---

## Project Structure

```
AI-Assistant/
├── server.ts              # Main Node.js backend (Express + WebSocket)
├── server_memory.ts       # Memory extraction pipeline
├── server_paths.ts        # Path & secret resolution
├── local-agent.js         # Local agent bridge
├── run_agent.py           # Python agent launcher
├── package.json           # Node dependencies
├── vite.config.ts         # Vite build config
├── tsconfig.json          # TypeScript config
├── index.html             # Frontend entry point
├── start-myraa.bat        # Launcher (visible console)
├── start-myraa-silent.bat # Launcher (silent, no console)
├── .env.example           # Environment variable template
├── memories.json          # Persistent memory storage
├── metadata.json          # App metadata
├── settings.json          # App settings
├── src/                   # React frontend
│   ├── App.tsx            # Main React app
│   ├── main.tsx           # Entry point
│   ├── index.css          # Global styles
│   ├── components/        # UI components
│   │   ├── ApiKeyGate.tsx
│   │   ├── BrowserAgent.tsx
│   │   ├── HolographicProjector.tsx
│   │   ├── MemoryDashboard.tsx
│   │   ├── MyraaCoreVisualizer.tsx
│   │   └── SettingsPanel.tsx
│   └── lib/               # Utilities
│       ├── audio.ts
│       ├── memoryTypes.ts
│       ├── settingsStore.ts
│       └── wakeWord.ts
├── desktop_agent/         # Python FastAPI desktop control
│   ├── main.py            # FastAPI app
│   ├── registry.py        # Tool registry
│   ├── requirements.txt   # Python dependencies
│   ├── tools_*.py         # Tool modules (15 files)
│   └── README.md          # Agent docs
├── electron/              # Electron desktop wrapper
│   ├── main.cjs           # Main process
│   ├── preload.cjs        # Preload script
│   └── splash.html        # Splash screen
└── assets/                # Video assets
    ├── idle.mp4
    ├── talking.mp4
    └── thinking.mp4
```

---

## Setup — Option A: Gemini API Key (Paid)

Use this if you have a Google Gemini API key. This mode supports **full memory extraction** (AI learns from your conversations).

### Step 1: Clone the Repository

```bash
git clone https://github.com/Shyamkumars769/AI-Assistant.git
cd AI-Assistant
```

### Step 2: Install Node.js Dependencies

```bash
npm install
```

### Step 3: Install Python Dependencies (for Desktop Agent)

```bash
cd desktop_agent
pip install -r requirements.txt
cd ..
```

### Step 4: Get a Gemini API Key

1. Go to [Google AI Studio](https://makersuite.google.com/apis/key)
2. Sign in with your Google account
3. Click **"Create API Key"**
4. Copy the key (starts with `AIza...`)

### Step 5: Configure the API Key

**Option 1: Create a `.env` file** (recommended)

Create a file named `.env` in the project root:

```
GEMINI_API_KEY=AIzaSyYourKeyHere
```

**Option 2: Set environment variable**

```powershell
$env:GEMINI_API_KEY="AIzaSyYourKeyHere"
```

### Step 6: Run MYRAA

```bash
npm run dev
```

Or use the batch file:

```cmd
start-myraa.bat
```

Open http://localhost:3000 in your browser.

---

## Setup — Option B: gemini-web2api Proxy (Free)

Use this if you want **free Gemini chat** without an API key. This mode uses the gemini-web2api proxy to access Gemini's web interface.

> **Note:** Memory extraction is disabled in proxy mode. The AI will remember things from the current session only.

### Step 1: Clone Both Repositories

```bash
# Clone MYRAA
git clone https://github.com/Shyamkumars769/AI-Assistant.git
cd AI-Assistant

# Clone gemini-web2api (in a separate folder)
cd ..
git clone https://github.com/Sophomoresty/gemini-web2api.git
cd AI-Assistant
```

### Step 2: Install Node.js Dependencies

```bash
npm install
```

### Step 3: Install Python Dependencies

```bash
# For MYRAA Desktop Agent
cd desktop_agent
pip install -r requirements.txt
cd ..

# For gemini-web2api
cd ../gemini-web2api
pip install httpx
cd ../AI-Assistant
```

### Step 4: Start the gemini-web2api Proxy

Open a new terminal and run:

```bash
cd path/to/gemini-web2api
python gemini_web2api.py --port 8081
```

**Verify it's running:**

```powershell
curl http://localhost:8081/v1/models
```

You should see a list of available Gemini models.

### Step 5: Set the Proxy Environment Variable

**Option 1: Set before running** (recommended)

```powershell
$env:GEMINI_WEB2API="http://localhost:8081"
```

**Option 2: Create a `.env` file**

Create a file named `.env` in the MYRAA project root:

```
GEMINI_WEB2API=http://localhost:8081
```

### Step 6: Run MYRAA

```bash
npm run dev
```

Open http://localhost:3000 in your browser.

---

## Running MYRAA

### Method 1: Development Mode (npm)

```bash
npm run dev
```

This starts the MYRAA server on http://localhost:3000

### Method 2: Batch File Launcher (Windows)

```cmd
start-myraa.bat
```

This launcher:
1. Cleans up any old processes on ports 3000 and 8765
2. Starts the Python Desktop Agent (port 8765)
3. Waits for the agent to be ready
4. Starts the MYRAA Node.js server (port 3000)

### Method 3: Silent Launcher (Windows)

```cmd
start-myraa-silent.bat
```

Same as above but runs silently in the background (no console window).

### Method 4: Electron Desktop App

```bash
npm run electron
```

Or build a standalone executable:

```bash
npm run dist
```

---

## Desktop Control Agent

MYRAA includes a Python FastAPI agent that provides 52 desktop automation tools:

| Category | Tools |
|----------|-------|
| **Applications** | openApplication, closeApplication |
| **Websites** | openWebsite, searchWeb, searchYouTube, searchGoogle, searchGitHub |
| **Files** | createFile, readFile, renameFile, deleteFile, moveFile, openFolder, listFiles, searchFiles |
| **PC Control** | volumeUp, volumeDown, muteToggle, setVolume, brightnessUp, brightnessDown, setBrightness |
| **Windows** | minimizeWindow, maximizeWindow, closeWindow, switchApplication |
| **Clipboard** | copySelected, pasteClipboard, getClipboard, clearClipboard |
| **Screenshots** | takeScreenshot, saveScreenshot, analyzeScreenshot, readScreen |
| **Browser** | desktopBrowserOpen, desktopBrowserNavigate, desktopBrowserClick, desktopBrowserType, etc. |
| **Coding** | createPythonFile, runPythonScript, createProjectFolder, writeCodeFile |
| **System** | systemInfo, gpuInfo, temperatureInfo |
| **Power** | requestPowerAction, executePowerAction |
| **Startup** | enableAutoStart, disableAutoStart, getAutoStartStatus |

### Running the Agent Standalone

```bash
cd desktop_agent
pip install -r requirements.txt
uvicorn main:app --host 127.0.0.1 --port 8765
```

The agent exposes:
- `http://127.0.0.1:8765/health` — Health check
- `http://127.0.0.1:8765/docs` — API documentation

---

## Troubleshooting

### "NO_API_KEY" Error

**API Key Mode:** Make sure your `.env` file has `GEMINI_API_KEY=AIzaSy...` or the environment variable is set.

**Proxy Mode:** Make sure `GEMINI_WEB2API=http://localhost:8081` is set and the proxy is running.

### Desktop Agent Won't Start

1. Check Python is installed: `python --version`
2. Install dependencies: `cd desktop_agent && pip install -r requirements.txt`
3. Test manually: `uvicorn main:app --host 127.0.0.1 --port 8765`
4. Check if port 8765 is in use: `netstat -ano | findstr :8765`

### Port Already in Use

Kill any existing processes:

```powershell
# Kill process on port 3000
for /f "tokens=5" %a in ('netstat -ano ^| findstr ":3000" ^| findstr "LISTENING"') do taskkill /PID %a /F

# Kill process on port 8765
for /f "tokens=5" %a in ('netstat -ano ^| findstr ":8765" ^| findstr "LISTENING"') do taskkill /PID %a /F
```

### gemini-web2api Not Working

1. Make sure the proxy is running: `python gemini_web2api.py --port 8081`
2. Test the proxy: `curl http://localhost:8081/v1/models`
3. Check if port 8081 is in use

### Memory Not Working

Memory extraction only works in **API Key mode**. In proxy mode, the AI remembers things from the current session only.

---

## References

- **gemini-web2api:** https://github.com/Sophomoresty/gemini-web2api
- **Google Gemini API:** https://ai.google.dev/

---

## License

MIT
