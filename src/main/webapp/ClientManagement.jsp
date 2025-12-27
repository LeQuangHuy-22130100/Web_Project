<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Management System</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f9;
    }

    header {
      background-color: #333;
      color: #fff;
      padding: 10px 20px;
      text-align: center;
    }

    .main {
      display: flex;
    }

    .sidebar {
      width: 250px;
      background-color: #2c3e50;
      color: #fff;
      padding: 20px;
      height: 100vh;
      position: fixed;
    }

    .sidebar h2 {
      margin-top: 0;
      margin-bottom: 20px;
    }

    .sidebar ul {
      list-style: none;
      padding: 0;
    }

    .sidebar ul li {
      margin-bottom: 10px;
    }

    .sidebar ul li a {
      color: #fff;
      text-decoration: none;
      padding: 10px;
      display: block;
      border-radius: 4px;
    }

    .sidebar ul li a:hover {
      background-color: #34495e;
    }

    .content {
      margin-left: 270px;
      padding: 20px;
      width: calc(100% - 270px);
    }

    h1, h2 {
      margin: 0 0 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }

    table th, table td {
      padding: 10px;
      text-align: left;
      border: 1px solid #ddd;
    }

    table th {
      background-color: #f4f4f4;
    }

    button {
      padding: 8px 12px;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .btn-delete {
      background-color: #dc3545;
    }

    section {
      margin-bottom: 40px;
      text-align: center;
    }
  </style>
</head>
<body>
<header>
  <h1>Management System</h1>
</header>
<div class="main">
  <div class="sidebar">
    <h2>Navigation</h2>
    <ul>
      <li><a href="./ProductManagement.html">Quản lý sản phẩm</a></li>
      <li><a href="#ClientManagement">Quản lý khách hàng</a></li>
      <li><a href="#information-management">Thông tin quản lý</a></li>
    </ul>
  </div>
  <div class="content">
    <!-- Employee Management -->
    <section id="employee-management">
      <h2>Quản lý khách hàng</h2>
      <table>
        <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>1</td>
          <td>Alice</td>
          <td>xxx@gmail.com</td>
          <td><button class="btn-delete">Delete</button></td>
        </tr>
        <tr>
          <td>2</td>
          <td>Bob</td>
          <td>bob@example.com</td>
          <td><button class="btn-delete">Delete</button></td>
        </tr>
        </tbody>
      </table>
    </section>

    <!-- Information Management -->
    <section id="information-management">
      <h2>Information Management</h2>
      <p>Here you can manage additional information for your system. This section can be customized as needed.</p>
    </section>
  </div>
</div>
</body>
</html>
