import React, { useState } from 'react';
import './Dashboard.css';
import SignIn from './SignIn';
import SignUp from './SignUp';

export default function Dashboard() {
  const [currentPage, setCurrentPage] = useState('dashboard');

  const handleSignUpButton = () => {
    setCurrentPage('signup');
  };

  const handleSignInButton = () => {
    setCurrentPage('signin');
  };

  const renderPage = () => {
    switch (currentPage) {
      case 'signin':
        return <SignIn />;
      case 'signup':
        return <SignUp />;
      default:
        return (
          <div className="box">
            <div className="paydart">
              <h1>PayDart Application</h1>
            </div>
            <nav className="navbar">
              <ul className="navbar-links">
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">College</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
              <button onClick={handleSignUpButton}>Sign Up</button>
              <button onClick={handleSignInButton}>Go to Sign In</button>
            </nav>
          </div>
        );
    }
  };

  return renderPage();
}
