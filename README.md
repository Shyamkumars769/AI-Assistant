# MYRAA AI Assistant

Desktop AI companion with holographic UI, voice chat, memory, and Windows automation.

---

## How to Run (Free Mode — No API Key)

### Step 1: Install These First

- [Node.js 18+](https://nodejs.org/) — Download and install
- [Python 3.11+](https://www.python.org/downloads/) — Download and install

### Step 2: Clone & Run

Open a terminal and run these commands one by one:

```bash
git clone https://github.com/Shyamkumars769/AI-Assistant.git
cd AI-Assistant
npm install
cd desktop_agent
pip install -r requirements.txt
cd ..
git clone https://github.com/Sophomoresty/gemini-web2api.git
cd gemini-web2api
pip install httpx
python gemini_web2api.py --port 8081
```

**Keep the proxy running.** Open a **new terminal** and run:

```bash
cd AI-Assistant
npm run dev
```

Open **http://localhost:3000** in your browser. Done!

---

## How to Run (With API Key — Full Memory)

Same as above but skip the gemini-web2api part. Instead:

1. Get a key from [Google AI Studio](https://makersuite.google.com/apis/key)
2. Create `.env` file in the project root:
   ```
   GEMINI_API_KEY=AIzaSyYourKeyHere
   ```
3. Run:
   ```bash
   npm install
   cd desktop_agent && pip install -r requirements.txt && cd ..
   npm run dev
   ```

---

## Windows Users — Use Batch Files

Instead of typing commands, just double-click these files:

| File | What it does |
|------|--------------|
| `start-myraa.bat` | Starts everything (agent + server) |
| `launchers/Launch-MYRAA-Proxy.bat` | Starts with free proxy mode |
| `launchers/Launch-MYRAA-Direct.bat` | Starts with API key mode |

---

## What You Need

| Requirement | Why |
|-------------|-----|
| Node.js 18+ | Runs the web server |
| Python 3.11+ | Runs the desktop control agent |
| gemini-web2api | Free proxy (only for free mode) |

---

## Troubleshooting

**"Command not found" error?**
- Make sure Node.js and Python are installed
- Restart your terminal after installing

**Port already in use?**
```bash
netstat -ano | findstr :3000
taskkill /PID <number> /F
```

**Proxy not working?**
- Make sure gemini-web2api is cloned next to AI-Assistant folder
- Both folders should be in the same directory:
  ```
  your-folder/
  ├── AI-Assistant/
  └── gemini-web2api/
  ```

---

## References

- gemini-web2api: https://github.com/Sophomoresty/gemini-web2api
- Gemini API: https://ai.google.dev/
