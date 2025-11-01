@echo off
cd /d "%~dp0"
echo ===============================
echo 🔄  AUTO UPDATE to GitHub START
echo ===============================

:loop
git pull origin main --rebase
git add .
git commit -m "Auto update from VS Code"
git push origin main
echo ✅ Perubahan sudah dikirim ke GitHub.
echo ⏳ Menunggu 60 detik untuk update berikutnya...
timeout /t 60 >nul
goto loop
