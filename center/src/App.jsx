import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
//import './App.css'

function App() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const handleUsernameChange = (e) => {
    setUsername(e.target.value);
  };

  const handlePasswordChange = (e) => {
    setPassword(e.target.value);
  };

  const handleLogin = () => {
    // Perform login logic here
    // You can make API requests to your backend server to validate the username and password
    // Example code using fetch:
    fetch('api.php?action=login', {
      method: 'POST',
      body: JSON.stringify({ username, password }),
      headers: {
        'Content-Type': 'application/json',
      },
    })
      .then((response) => response.json())
      .then((data) => {
        // Handle login response
        if (data.success) {
          // Login successful
          console.log('Login successful');
          // Perform any necessary actions like redirecting to a dashboard page
        } else {
          // Login failed
          console.log('Login failed');
          // Show error message to the user or perform any necessary actions
        }
      })
      .catch((error) => {
        console.error('Error:', error);
        // Handle error if the API request fails
      });
  };



  
  return (
    <div>
      <h1>Login Page</h1>
      <form>
        <div>
          <label htmlFor="username">Username:</label>
          <input
            type="text"
            id="username"
            value={username}
            onChange={handleUsernameChange}
          />
        </div>
        <div>
          <label htmlFor="password">Password:</label>
          <input
            type="password"
            id="password"
            value={password}
            onChange={handlePasswordChange}
          />
        </div>
        <button type="button" onClick={handleLogin}>
          Login
        </button>
      </form>
    </div>
  );
}

export default App;