<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/dashboard">
        <div class="sidebar-brand-icon">
            <i class="bi bi-laptop"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Leo Laptop</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0"/>

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="/admin/dashboard">
            <i class="fas fa-home"></i>
            <span>Dashboard</span></a
        >
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider"/>

    <!-- Heading -->
    <div class="sidebar-heading">Management</div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item active">
        <a class="nav-link" href="/admin/users">
            <i class="far fa-user"></i>
            <span>User</span></a
        >
    </li>

    <li class="nav-item active">
        <a class="nav-link" href="/admin/orders">
            <i class="fas fa-shopping-basket"></i>
            <span>Order</span></a
        >
    </li>

    <li class="nav-item active">
        <a class="nav-link" href="/admin/products?page=1">
            <i class="fas fa-laptop"></i>
            <span>Product</span></a
        >
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider"/>

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle">
        </button>
    </div>
</ul>
