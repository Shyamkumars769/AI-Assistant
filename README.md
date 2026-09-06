# MYRAA AI Assistant

A desktop AI companion with holographic UI, voice chat, memory, and full Windows automation.

**Two ways to use:**
- **Free Mode** — No API key needed (uses gemini-web2api proxy)
- **API Key Mode** — Direct Gemini API (full memory extraction)

---

## Quick Start (Free Mode — Recommended)

### 1. Install Requirements

- [Node.js 18+](https://nodejs.org/)
- [Python 3.11+](https://www.python.org/downloads/)

### 2. Clone This Repo

```bash
git clone https://github.com/Shyamkumars769/AI-Assistant.git
cd AI-Assistant
```

### 3. Install Dependencies

```bash
npm install
cd desktop_agent
pip install -r requirements.txt
cd ..
```

### 4. Clone & Start gemini-web2api (Free Proxy)

```bash
git clone https://github.com/Sophomoresty/gemini-web2api.git
cd gemini-web2api
pip install httpx
python gemini_web2api.py --port 8081
```

Keep this running. Open a **new terminal** for the next step.

### 5. Start MYRAA

```bash
cd AI-Assistant
npm run dev
```

Open http://localhost:3000

---

## API Key Mode (Full Memory)

If you have a Gemini API key:

1. Get a key from [Google AI Studio](https://makersuite.google.com/apis/key)
2. Create `.env` file in the project root:
   ```
   GEMINI_API_KEY=AIzaSyYourKeyHere
   ```
3. Run:
   ```bash
   npm run dev
   ```

---

## Windows Batch Launchers

For one-click launch on Windows, use the batch files in `launchers/`:

| File | What it does |
|------|--------------|
| `Launch-MYRAA-Proxy.bat` | Starts proxy + MYRAA (free mode) |
| `Launch-MYRAA-Direct.bat` | Starts MYRAA with API key mode |
| `MYRAA-Launcher.bat` | One-click launcher (free mode) |

Double-click any `.bat` file to run.

---

## Project Structure

```
AI-Assistant/
├── server/                 # Node.js backend
│   ├── server.ts           # Main server (Express + WebSocket)
│   ├── server_memory.ts    # Memory system
│   └── server_paths.ts     # Path & config
├── src/                    # React frontend
│   ├── App.tsx
│   └── components/         # UI components
├── desktop_agent/          # Python desktop control (52 tools)
│   ├── main.py
│   └── tools_*.py
├── electron/               # Desktop app wrapper
├── launchers/              # Windows batch launchers
├── assets/                 # Video files
├── package.json
└── README.md
```

---

## Desktop Control

MYRAA can control your Windows PC:
- Open/close apps
- Browse files
- Volume/brightness control
- Take screenshots
- Browser automation
- Run Python scripts

The Python agent starts automatically with MYRAA.

---

## Troubleshooting

**"NO_API_KEY" error?**
- Free mode: Make sure gemini-web2api is running on port 8081
- API key mode: Check your `.env` file has the correct key

**Port already in use?**
```bash
netstat -ano | findstr :3000
taskkill /PID <number> /F
```

**Desktop agent not working?**
```bash
cd desktop_agent
pip install -r requirements.txt
python -m uvicorn main:app --port 8765
```

---

## References

- gemini-web2api: https://github.com/Sophomoresty/gemini-web2api
- Gemini API: https://ai.google.dev/
