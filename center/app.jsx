import Dashboard from "./Dashboard";
import Login from "./Login";
import React from "react"

import AddTransaction from "./AddTransaction"
import {
  Route,
  Routes,
} from "react-router-dom";

function App() {
  return (

      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/Dashboard" element={<Dashboard />} />
        <Route path="/AddTransaction" element ={<AddTransaction />} />
      </Routes>
  );
}

export default App;