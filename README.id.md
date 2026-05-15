<div align="center">

# ✈️ Pelacak Penerbangan SFO-JKT

**Toolchain Pelacakan Penerbangan Pribadi**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.7+](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/)
[![PowerShell 5.1+](https://img.shields.io/badge/powershell-5.1+-blue.svg)](https://github.com/PowerShell/PowerShell)
[![CI Status](https://img.shields.io/badge/CI-GitHub_Actions-brightgreen.svg)](.github/workflows/test.yml)
[![pip install](https://img.shields.io/badge/pip-installable-blue.svg)](#-instalasi)

*Sistem pelacakan penerbangan lengkap untuk rute **San Francisco ✈️ Jakarta** via Tokyo*

**Dibuat dengan Python & PowerShell • Zero-config • Terminal-first • Timezone-aware**

</div>

---

<div align="center">

**Rute**: SFO → HND → CGK → HND → SFO  
**Tanggal**: 2-3 Juli 2026 (Berangkat) | 19-20 Juli 2026 (Pulang)  
**Maskapai**: All Nippon Airways (ANA)  
**Misi**: Lacak, visualisasi, dan analisis itinerary Anda dari command line

[Mulai Cepat](#-mulai-cepat) • [Instalasi](#-instalasi) • [Fitur](#-fitur) • [Dokumentasi](#-dokumentasi)

</div>

---

## 📸 Tampilan Output

<details>
<summary><b>🐍 Python Tracker</b> (klik untuk expand)</summary>

```
🛫🛫🛫🛫🛫🛫 APLIKASI PELACAK PENERBANGAN 🛬🛬🛬🛬🛬🛬

══════════════════════════════════════════════════════════════════════

PENERBANGAN BERANGKAT:

FLIGHT ANA 107 — SFO → HND
Keberangkatan : 2 Jul, 01:40 AM PDT → Kedatangan : 3 Jul, 04:25 AM JST
Durasi        : 10j 45m | Kursi : 34A, 34C | Status : ✅ Tiba

TRANSIT: 5j 50m di Tokyo (HND)

FLIGHT ANA 855 — HND → CGK
Keberangkatan : 3 Jul, 10:15 AM JST → Kedatangan : 3 Jul, 04:00 PM WIB
Durasi        : 7j 45m | Kursi : 21A, 21B | Status : ✅ Tiba

══════════════════════════════════════════════════════════════════════
```
</details>

<details>
<summary><b>⚡ PowerShell Tracker</b> (klik untuk expand)</summary>

```powershell
PS> .\flight-tracker-all.ps1 -ShowAll

════════════════════════════════════════
	✈️  PELACAK PENERBANGAN - SFO KE JKT  ✈️
════════════════════════════════════════

📍 PENERBANGAN BERANGKAT

Flight: ANA 107 (SFO → HND)
  Berangkat: 2026-07-02 01:40 AM PDT
  Tiba     : 2026-07-03 04:25 AM JST
  Status   : ⏱️  Terjadwal
  Kursi    : 34A, 34C

⏳ Transit: 5:50 di Tokyo (HND)

Flight: ANA 855 (HND → CGK)
  Berangkat: 2026-07-03 10:15 AM JST
  Tiba     : 2026-07-03 04:00 PM WIB
  Status   : ⏱️  Terjadwal
  Kursi    : 21A, 21B

════════════════════════════════════════
```
</details>

<details>
<summary><b>🗺️ Peta Rute</b> (klik untuk expand)</summary>

```
════════════════════════════════════════════════════════════
				   🗺️  PETA RUTE PENERBANGAN  🗺️
════════════════════════════════════════════════════════════

BERANGKAT: San Francisco → Jakarta (via Tokyo)

	SFO (San Francisco)
	 |
	 | Penerbangan ANA 107
	 | Durasi: 10:45
	 |
	 ↓
	HND (Tokyo Haneda)
	 |
	 | Transit: 5:50
	 |
	 | Penerbangan ANA 855
	 | Durasi: 7:45
	 |
	 ↓
	CGK (Jakarta)

════════════════════════════════════════════════════════════
```
</details>

---

## 🚀 Instalasi

### Opsi 1: pip (Direkomendasikan)
```bash
pip install git+https://github.com/tjpools/SFO-JKT.git
flight-tracker  # Jalankan dari mana saja!
```

### Opsi 2: Clone & Gunakan
```bash
git clone https://github.com/tjpools/SFO-JKT.git
cd SFO-JKT

# Python
pip install -r requirements.txt
python flight_tracker.py

# PowerShell
.\flight-tracker-all.ps1 -ShowAll
```

### Opsi 3: PowerShell Module
```powershell
Import-Module .\FlightTools.psd1
Show-FlightTracker -ShowAll
```

### Opsi 4: VS Code Tasks
```
Ctrl+Shift+B  # Jalankan tracker default
Ctrl+Shift+P → Tasks: Run Task  # Lihat semua task
```

Lihat [PYTHON_PACKAGE.md](PYTHON_PACKAGE.md) dan [TASK_RUNNER.md](TASK_RUNNER.md) untuk detail.

---

## ⚡ Mulai Cepat

### Python
```bash
python flight_tracker.py
```

### PowerShell (Basic)
```powershell
.\flight-tracker.ps1
```

### PowerShell (Semua Fitur)
```powershell
.\flight-tracker-all.ps1 -ShowAll
```

---

## 🎯 Fitur

<table>
<tr>
<td width="50%">

### 🐍 Python
- ✅ Penanganan datetime timezone-aware
- ✅ Output tabel cantik (tabulate)
- ✅ Status penerbangan berikutnya
- ✅ Kalkulasi waktu transit
- ✅ Konversi UTC
- ✅ Paket pip-installable
- ✅ Cross-platform (Win/Mac/Linux)

</td>
<td width="50%">

### ⚡ PowerShell
- ✅ Tanpa dependensi
- ✅ Output berwarna
- ✅ Pelacakan keterlambatan
- ✅ Peta rute ASCII
- ✅ Class FlightLeg modular
- ✅ Switch command-line
- ✅ Module yang bisa diimport

</td>
</tr>
</table>

### 🛠️ Tools Pengembangan
- ✅ **GitHub Actions CI** - Auto-test pada push
- ✅ **VS Code Tasks** - Eksekusi satu-klik (`Ctrl+Shift+B`)
- ✅ **PowerShell Module** - `Import-Module FlightTools`
- ✅ **Suite Test Lokal** - `test-all.ps1` memvalidasi semuanya
- ✅ **Windows Terminal Theme** - Skema warna hijau/kuning custom

---

## 📦 Isi Paket

```
SFO-JKT/
├── 🐍 Implementasi Python
│   ├── flight_tracker.py          # Aplikasi tracker utama
│   ├── requirements.txt           # Dependensi
│   └── pyproject.toml             # Konfigurasi paket
│
├── ⚡ Script PowerShell
│   ├── flight-tracker.ps1         # Tracker basic
│   ├── flight-tracker-all.ps1     # All-in-one (direkomendasikan)
│   ├── flight-tracker-with-delays.ps1
│   ├── flight-tracker-utc.ps1
│   ├── flight-map.ps1             # Peta ASCII
│   ├── FlightLeg.ps1              # Class modular
│   └── utc-converter.ps1
│
├── 📦 PowerShell Module
│   ├── FlightTools.psd1           # Manifest module
│   └── FlightTools.psm1           # Kode module
│
├── 🔧 Development Tools
│   ├── .vscode/tasks.json         # Integrasi VS Code
│   ├── .github/workflows/test.yml # Pipeline CI
│   └── test-all.ps1               # Verifikasi lokal
│
├── 🎨 Extras
│   └── windows-terminal-theme.json
│
└── 📚 Dokumentasi
	├── README.md                   # Anda di sini
	├── README.id.md                # Versi Bahasa Indonesia
	├── QUICKSTART.md
	├── PYTHON_PACKAGE.md
	├── TASK_RUNNER.md
	├── README-PowerShell.md
	└── [dan 10+ dokumen lainnya]
```

---

## 📖 Contoh Penggunaan

### PowerShell - Semua Fitur
```powershell
# Output basic
.\flight-tracker-all.ps1

# Dengan pelacakan keterlambatan
.\flight-tracker-all.ps1 -ShowDelays

# Dengan konversi UTC
.\flight-tracker-all.ps1 -ShowUTC

# Dengan peta rute
.\flight-tracker-all.ps1 -ShowMap

# Semuanya!
.\flight-tracker-all.ps1 -ShowAll
```

### PowerShell Module
```powershell
# Import module
Import-Module .\FlightTools.psd1

# Gunakan alias cepat
flights

# Atau fungsi lengkap
Show-FlightTracker -ShowAll
Show-FlightMap
Show-FlightDelays
Show-FlightUTC
```

### Python - Sebagai Library
```python
from flight_tracker import create_itinerary

itinerary = create_itinerary()
itinerary.display_itinerary()
itinerary.display_summary_table()
itinerary.display_next_flight()
```

---

## ✈️ Itinerary Penerbangan

### Berangkat (2-3 Juli 2026)
1. **ANA 107**: SFO → HND (10j 45m)
   - Keberangkatan: 01:40 AM PDT | Kedatangan: 04:25 AM JST
   - Kursi: 34A, 34C

2. **ANA 855**: HND → CGK (7j 45m)
   - Transit: 5j 50m di Tokyo
   - Keberangkatan: 10:15 AM JST | Kedatangan: 04:00 PM WIB
   - Kursi: 21A, 21B

### Pulang (19-20 Juli 2026)
3. **ANA 856**: CGK → HND (7j 25m)
   - Keberangkatan: 09:25 PM WIB | Kedatangan: 06:50 AM JST
   - Kursi: 21A, 21B

4. **ANA 108**: HND → SFO (11j 00m)
   - Transit: 16j 05m di Tokyo
   - Keberangkatan: 10:55 PM JST | Kedatangan: 04:55 PM PDT
   - Kursi: 32A, 32C

**Total Waktu Perjalanan**: 
- Berangkat: ~24 jam (termasuk transit)
- Pulang: ~34 jam (termasuk transit)

---

## 📚 Dokumentasi

### Panduan Memulai
- **[START_HERE.md](START_HERE.md)** - Mulai di sini
- **[QUICKSTART.md](QUICKSTART.md)** - Panduan 60 detik
- **[SETUP.md](SETUP.md)** - Setup environment

### Panduan Instalasi
- **[PYTHON_PACKAGE.md](PYTHON_PACKAGE.md)** - Panduan instalasi pip
- **[TASK_RUNNER.md](TASK_RUNNER.md)** - Integrasi VS Code
- **[README-PowerShell.md](README-PowerShell.md)** - Deep-dive PowerShell

### Untuk Developer
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Cara berkontribusi
- **[GITHUB_SETUP.md](GITHUB_SETUP.md)** - Setup repository
- **[GIT_COMMANDS.md](GIT_COMMANDS.md)** - Referensi Git

### Status Project
- **[PRODUCTION_READY.md](PRODUCTION_READY.md)** - Ringkasan misi
- **[EXECUTIVE_SUMMARY.md](EXECUTIVE_SUMMARY.md)** - Overview lengkap
- **[WHATS_NEXT.md](WHATS_NEXT.md)** - Roadmap opsional
- **[CHANGELOG.md](CHANGELOG.md)** - Riwayat versi

---

## 🎨 Windows Terminal Theme

Untuk menerapkan skema warna **GreenYellowFlight** yang cantik:

1. Buka Windows Terminal
2. Tekan `Ctrl + ,` (Settings)
3. Klik **"Open JSON file"** (kiri-bawah)
4. Cari array `"schemes"`
5. Copy isi `windows-terminal-theme.json` ke dalam array
6. Di profil PowerShell Anda, set:
   ```json
   {
	 "colorScheme": "GreenYellowFlight"
   }
   ```
7. Save dan reload!

---

## 🧪 Testing

### Tes Lokal
```powershell
.\test-all.ps1
```

Memeriksa:
- ✅ Script Python ada
- ✅ Requirements.txt hadir
- ✅ Script PowerShell ada
- ✅ Dokumentasi lengkap
- ✅ File konfigurasi hadir
- ✅ Python/Git terinstal
- ✅ Virtual environment setup
- ✅ Eksekusi PowerShell bekerja
- ✅ Dependensi Python terinstal
- ✅ File module hadir

### CI Testing (GitHub Actions)
- **Python**: Ditest pada versi 3.8, 3.9, 3.10, 3.11, 3.12
- **PowerShell**: Divalidasi pada windows-latest
- **Otomatis**: Berjalan pada setiap push ke main

---

## 🤝 Berkontribusi

Kontribusi sangat diterima! Lihat [CONTRIBUTING.md](CONTRIBUTING.md) untuk panduan.

### Quick Contribution
```bash
# Fork repo
# Clone fork Anda
git clone https://github.com/YOUR_USERNAME/SFO-JKT.git
cd SFO-JKT

# Buat branch
git checkout -b fitur-baru-saya

# Buat perubahan
# Test perubahan Anda
.\test-all.ps1

# Commit dan push
git add .
git commit -m "Tambah fitur baru"
git push origin fitur-baru-saya

# Buat Pull Request di GitHub
```

---

## 📄 Lisensi

Proyek ini dilisensikan di bawah MIT License - lihat file [LICENSE](LICENSE) untuk detail.

---

## 🙏 Acknowledgments

- **All Nippon Airways (ANA)** - Untuk layanan penerbangan yang luar biasa
- **Python Community** - Untuk pytz, tabulate, dan tools lainnya
- **PowerShell Team** - Untuk platform scripting yang powerful
- **GitHub** - Untuk hosting dan CI/CD gratis

---

## 📞 Support & Link

- **Repository**: https://github.com/tjpools/SFO-JKT
- **Issues**: https://github.com/tjpools/SFO-JKT/issues
- **Discussions**: https://github.com/tjpools/SFO-JKT/discussions
- **Clone**: `git clone https://github.com/tjpools/SFO-JKT.git`
- **Install**: `pip install git+https://github.com/tjpools/SFO-JKT.git`

---

## ⭐ Dukung Proyek Ini

Jika Anda merasa proyek ini berguna, beri ⭐ di GitHub!

```bash
# Share dengan teman
echo "Cek pelacak penerbangan keren ini! https://github.com/tjpools/SFO-JKT"
```

---

## 🌍 Bahasa

- 🇺🇸 [English](README.md) - Versi Inggris (original)
- 🇮🇩 [Bahasa Indonesia](README.id.md) - Versi Indonesia (Anda di sini)

---

<div align="center">

**Dibuat dengan ❤️ oleh Terrence J McLaughlin (@tjpools)**

**Status**: 🚀 PRODUCTION READY

**Sekarang bangun sesuatu yang luar biasa.** ✈️

</div>

---

## 💡 Tips untuk Pengguna Indonesia

### Zona Waktu
Script ini secara otomatis menangani konversi zona waktu:
- **WIB** (Waktu Indonesia Barat) untuk Jakarta (CGK)
- **JST** (Japan Standard Time) untuk Tokyo (HND)
- **PDT** (Pacific Daylight Time) untuk San Francisco (SFO)
- **UTC** untuk waktu universal

### Menjalankan di Indonesia
Jika Anda menjalankan script ini dari Jakarta:
```powershell
# Script akan otomatis menampilkan waktu lokal WIB
.\flight-tracker-all.ps1 -ShowAll

# Untuk melihat semua zona waktu termasuk UTC
.\flight-tracker-all.ps1 -ShowUTC
```

### Bahasa Output
Saat ini output program masih dalam bahasa Inggris, tetapi Anda bisa memodifikasi script untuk bahasa Indonesia dengan mengedit:
- `flight_tracker.py` untuk versi Python
- `flight-tracker-all.ps1` untuk versi PowerShell

### Pertanyaan?
Jangan ragu untuk membuka [Issue](https://github.com/tjpools/SFO-JKT/issues) jika Anda punya pertanyaan atau butuh bantuan!

---

**Selamat Terbang! ✈️🇮🇩**
