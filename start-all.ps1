Write-Host "=== Cargo Shipment Tracker - Starting All Services ===" -ForegroundColor Yellow
Write-Host ""

# Check if MongoDB is running
Write-Host "Checking MongoDB..." -ForegroundColor Cyan
$mongoProcess = Get-Process -Name "mongod" -ErrorAction SilentlyContinue
if ($mongoProcess) {
    Write-Host "✓ MongoDB is running" -ForegroundColor Green
} else {
    Write-Host "⚠ MongoDB is not running. Please start MongoDB before proceeding." -ForegroundColor Red
    Write-Host "You can start MongoDB with: mongod --dbpath C:\data\db" -ForegroundColor Yellow
}

Write-Host ""

# Start Backend Server
Write-Host "Starting Backend Server (Node.js/Express)..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd 'D:\assignments\cargoShipmentTracker\backend'; Write-Host 'Backend Server Starting...' -ForegroundColor Green; npm run dev"

# Wait a bit for backend to start
Start-Sleep -Seconds 3

# Start Frontend Server
Write-Host "Starting Frontend Server (React)..." -ForegroundColor Blue
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd 'D:\assignments\cargoShipmentTracker\frontend'; Write-Host 'Frontend Server Starting...' -ForegroundColor Blue; npm start"

Write-Host ""
Write-Host "=== Services Starting ===" -ForegroundColor Yellow
Write-Host "Backend API: http://localhost:5000" -ForegroundColor Green
Write-Host "Frontend App: http://localhost:3000" -ForegroundColor Blue
Write-Host ""
Write-Host "API Endpoints to test:" -ForegroundColor Cyan
Write-Host "- GET  http://localhost:5000/health" -ForegroundColor White
Write-Host "- GET  http://localhost:5000/api/shipments" -ForegroundColor White
Write-Host "- POST http://localhost:5000/api/shipment" -ForegroundColor White
Write-Host ""
Write-Host "Press any key to continue..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
