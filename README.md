# Cargo Shipment Tracker

A full-stack application for tracking cargo shipments with real-time location updates and interactive map visualization.

## Features

- **Dashboard**: Tabular view of all shipments with sorting and filtering capabilities
- **Map Integration**: Interactive map showing shipment routes and current locations
- **Real-time Updates**: Update shipment locations and recalculate ETAs
- **CRUD Operations**: Create, read, update shipments
- **Responsive Design**: Works on desktop and mobile devices

## Tech Stack

### Backend
- **Node.js** with Express.js
- **MongoDB** with Mongoose ODM
- **RESTful API** design
- **Security**: Helmet, CORS, Rate limiting
- **Environment Configuration**: dotenv

### Frontend
- **React** with functional components and hooks
- **Redux Toolkit** for state management
- **React-Leaflet** for interactive maps
- **Tailwind CSS** for styling
- **Axios** for API calls

## Project Structure

```
cargoShipmentTracker/
├── backend/
│   ├── src/
│   │   ├── config/
│   │   │   └── database.js
│   │   ├── controllers/
│   │   │   └── shipmentController.js
│   │   ├── middleware/
│   │   │   └── errorHandler.js
│   │   ├── models/
│   │   │   └── Shipment.js
│   │   ├── routes/
│   │   │   └── shipmentRoutes.js
│   │   ├── services/
│   │   │   └── etaService.js
│   │   └── server.js
│   ├── package.json
│   └── .env
└── frontend/
    ├── src/
    │   ├── components/
    │   │   ├── Dashboard.js
    │   │   ├── ShipmentTable.js
    │   │   ├── ShipmentForm.js
    │   │   └── MapView.js
    │   ├── redux/
    │   │   ├── slices/
    │   │   │   └── shipmentSlice.js
    │   │   └── store.js
    │   ├── services/
    │   │   └── api.js
    │   ├── styles/
    │   │   ├── App.css
    │   │   └── index.css
    │   ├── App.js
    │   └── index.js
    ├── public/
    │   └── index.html
    ├── package.json
    └── tailwind.config.js
```

## API Endpoints

### Shipments
- `GET /api/shipments` - Get all shipments
- `GET /api/shipment/:id` - Get specific shipment
- `POST /api/shipment` - Create new shipment
- `POST /api/shipment/:id/update-location` - Update shipment location
- `GET /api/shipment/:id/eta` - Get shipment ETA

## Installation & Setup

### Prerequisites
- Node.js (v14 or higher)
- MongoDB (local or cloud instance)
- npm or yarn

### Backend Setup
1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create a `.env` file with your configuration:
   ```env
   NODE_ENV=development
   PORT=5000
   MONGODB_URI=mongodb://localhost:27017/cargo-shipment-tracker
   JWT_SECRET=your-jwt-secret-key-here
   JWT_EXPIRE=30d
   CORS_ORIGIN=http://localhost:3000
   ```

4. Start the development server:
   ```bash
   npm run dev
   ```

### Frontend Setup
1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the React development server:
   ```bash
   npm start
   ```

The application will be available at:
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000

## Usage

1. **View Shipments**: The dashboard displays all shipments in a tabular format
2. **Add Shipment**: Click "Add New Shipment" to create a new shipment entry
3. **Filter & Sort**: Use the status filter and column sorting in the table
4. **Map View**: Click "View on Map" to see the shipment route and current location
5. **Update Location**: Use the API endpoint to update shipment locations

## Data Model

### Shipment Schema
```javascript
{
  shipmentId: String (required, unique),
  containerId: String (required),
  route: [String] (array of locations),
  currentLocation: String (required),
  eta: Date (calculated automatically),
  status: String (enum: 'Pending', 'In Transit', 'Delivered'),
  createdAt: Date,
  updatedAt: Date
}
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## License

This project is licensed under the ISC License.
