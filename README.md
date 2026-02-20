# HostPeek 👀

**Minimal Bash system monitor**

HostPeek is a lightweight CLI tool that displays essential system information quickly and cleanly.
It provides a simple overview of a host without heavy dependencies or complex setup.

---

## ✨ What it does

* Shows basic system metrics
* Runs with zero dependencies
* Clean terminal output
* Optional JSON export for automation

---

## 📦 Features

* Memory, CPU, disk, tcp, and kernel info
* TCP connections overview
* Full summary mode
* Modular Bash structure
* Export results to JSON

---

## 📊 Available Commands

| Flag       | Description            |
| ---------- | ---------------------- |
| `--memory` | Memory usage overview  |
| `--cpu`    | CPU metrics            |
| `--disk`   | Disk usage summary     |
| `--tcp`    | Active TCP connections |
| `--kernel` | Kernel and OS info     |
| `--all`    | Full system summary    |
| `--json`   | Export output as JSON  |
| `--help`   | Show usage             |

---

## 🚀 Usage

```bash
chmod +x hostpeek.sh
./hostpeek.sh --all
```

Run specific checks:

```bash
./hostpeek.sh --memory
./hostpeek.sh --cpu
./hostpeek.sh --json
```

---

## 📤 JSON Output Example

```json
{
  "memory": {
    "used": "1.2GB",
    "free": "6.8GB"
  }
}
```

Useful for automation, logging, or shell pipelines.

---

## 👨‍💻 Author

**Javier Uribe**
Built as a clean, modular Bash project to showcase practical CLI design and Linux fundamentals.
