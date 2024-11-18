import React from 'react';
import './SignUp.css';

function SignUp() {
  return (
    <div className="signup-container">
      <h1>Create an Account</h1>
      <form className="signup-form">
        <label>
          Name:
          <input type="text" name="name" required />
        </label>
        <br />
        <label>
          Email:
          <input type="email" name="email" required />
        </label>
        <br />
        <label>
          Password:
          <input type="password" name="password" required />
        </label>
        <br />
        <label>
          Confirm Password:
          <input type="password" name="confirmPassword" required />
        </label>
        <br />
        <button type="submit">Sign Up</button>
      </form>
    </div>
  );
}

export default SignUp;
