@echo off
cd /d "C:\Users\LENOVO\Documents\AWEB\JaHu2025"

:: Cek apakah ada perubahan di Git
git diff --quiet
if %errorlevel% neq 0 (
    :: Ambil tanggal dan waktu
    for /f "tokens=1-3 delims=/ " %%a in ("%date%") do (
        for /f "tokens=1-2 delims=: " %%x in ("%time%") do (
            set "datetime=%%a-%%b-%%c_%%x-%%y"
        )
    )
    call git add .
    call git commit -m "auto update %datetime%"
    call git push origin main
    echo ------------------------------
    echo ✅ File berhasil diupdate ke GitHub!
    echo 🕒 Commit: auto update %datetime%
) else (
    echo ------------------------------
    echo ⚙️ Tidak ada perubahan, jadi tidak di-push.
)
pause
