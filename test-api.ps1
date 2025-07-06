Write-Host "=== Testing Cargo Shipment Tracker API ===" -ForegroundColor Yellow
Write-Host ""

# Test Health Endpoint
Write-Host "1. Testing Health Endpoint..." -ForegroundColor Cyan
try {
    $healthResponse = Invoke-RestMethod -Uri "http://localhost:5000/health" -Method GET
    Write-Host "✓ Health check successful" -ForegroundColor Green
    Write-Host "Response: $($healthResponse | ConvertTo-Json)" -ForegroundColor White
} catch {
    Write-Host "✗ Health check failed: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""

# Test Get All Shipments
Write-Host "2. Testing Get All Shipments..." -ForegroundColor Cyan
try {
    $shipmentsResponse = Invoke-RestMethod -Uri "http://localhost:5000/api/shipments" -Method GET
    Write-Host "✓ Get shipments successful" -ForegroundColor Green
    Write-Host "Found $($shipmentsResponse.Count) shipments" -ForegroundColor White
} catch {
    Write-Host "✗ Get shipments failed: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""

# Test Create Shipment
Write-Host "3. Testing Create Shipment..." -ForegroundColor Cyan
$testShipment = @{
    shipmentId = "SHIP-TEST-001"
    containerId = "CONT-TEST-001"
    route = @("New York", "Philadelphia", "Atlanta", "Miami")
    currentLocation = "New York"
    status = "Pending"
} | ConvertTo-Json

try {
    $createResponse = Invoke-RestMethod -Uri "http://localhost:5000/api/shipment" -Method POST -Body $testShipment -ContentType "application/json"
    Write-Host "✓ Create shipment successful" -ForegroundColor Green
    Write-Host "Created shipment ID: $($createResponse.shipmentId)" -ForegroundColor White
} catch {
    Write-Host "✗ Create shipment failed: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "=== API Testing Complete ===" -ForegroundColor Yellow
