<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Profile - Children Care System</title>
        <meta name="description" content="Manage your profile information">

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="assets/images/favicon.ico">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    </head>

    <body>
        <!-- Include Header -->
        <header class="header">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container">
                    <a class="navbar-brand" href="index.html">
                        <img src="assets/images/children-care-logo-removebg.png" alt="Children Care Logo" class="logo">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-auto align-items-center">
                            <li class="nav-item">
                                <a class="nav-link active" href="home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="services.html">Services</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Our Doctors</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="blog">Blogs</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
                            </li>
                            <li class="nav-item ms-lg-3">
                                <a class="btn btn-primary rounded-pill px-4" href="#">
                                    <i class="fas fa-calendar-check me-2"></i>Book Appointment
                                </a>
                            </li>
                            <c:choose>
                                <c:when test="${sessionScope.account == null}">
                                    <li class="nav-item ms-lg-2">
                                        <a class="btn btn-outline-primary rounded-pill px-4" href="login">
                                            <i class="fas fa-user me-2"></i>Login
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item ms-lg-2">
                                        <a class="btn btn-outline-primary rounded-pill px-4" href="userProfile">
                                            <i class="fas fa-user me-2"></i>Profile
                                        </a>
                                    </li>
                                    <li class="nav-item ms-lg-2">
                                        <a class="btn btn-outline-danger rounded-pill px-4" href="logout">
                                            <i class="fas fa-sign-out-alt me-2"></i>Logout
                                        </a>
                                    </li>
                                </c:otherwise>
                            </c:choose>

                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <main id="main-content">
            <!-- Profile Hero Section -->
            <section class="profile-hero">
                <div class="container">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item active">My Profile</li>
                        </ol>
                    </nav>
                </div>
            </section>

            <!-- Profile Content -->
            <section class="profile-content py-5">
                <div class="container">
                    <div class="row">
                        <!-- Sidebar Navigation -->
                        <div class="col-lg-3">
                            <div class="profile-sidebar rounded-4 shadow-sm p-4">
                                <div class="user-info text-center mb-4">
                                    <div class="avatar-wrapper position-relative">
                                        <img src="assets/images/Profile/${sessionScope.account.person.image}" alt="Profile Avatar" id="userAvatar"
                                             class="profile-avatar rounded-circle shadow-sm">

                                        <form action="uploadImage" method="post" id="uploadForm">
                                            <input type="text" name="personId" value="${sessionScope.account.person.personId}" hidden="">
                                            <label for="avatarUpload" class="avatar-upload-btn position-absolute">
                                                <i class="fas fa-camera"></i>
                                                <span class="upload-tooltip">Change Photo</span>
                                            </label>
                                            <input type="file" name="image" id="avatarUpload" accept="image/*" class="d-none">
                                        </form>

                                    </div>
                                    <h4 class="user-name mt-3 mb-1 fw-semibold" id="sidebarUserName">${sessionScope.account.person.personName}</h4>
                                    <p class="user-email text-muted small mb-0" id="sidebarUserEmail">${sessionScope.account.email}</p>
                                </div>

                                <div class="profile-nav d-flex flex-column gap-2">
                                    <a href="userProfile"
                                       class="nav-link rounded-3 p-3 d-flex align-items-center"
                                       data-tab="profileInformation">
                                        <i class="fas fa-user me-3"></i>Profile Information
                                        <i class="fas fa-chevron-right ms-auto"></i>
                                    </a>
                                    <a href="changePassword"
                                       class="nav-link rounded-3 p-3 d-flex align-items-center active" data-tab="changePassword">
                                        <i class="fas fa-lock me-3"></i>Change Password
                                        <i class="fas fa-chevron-right ms-auto"></i>
                                    </a>
                                    <a href="myReservation"
                                       class="nav-link rounded-3 p-3 d-flex align-items-center" data-tab="myReservations">
                                        <i class="fas fa-calendar-check me-3"></i>My Reservations
                                        <i class="fas fa-chevron-right ms-auto"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Main Content -->
                        <div class="col-lg-9">
                            <!-- Change Password Tab -->
                            <div class="content-card bg-white rounded-4 shadow-sm p-4 tab-content">
                                <h2 class="mb-4">Change Password</h2>

                                <form action="changePassword" method="post" onsubmit="showAlert();">
                                    <div class="row g-4">
                                        <div class="col-md-12">
                                            <label class="form-label">Current Password</label>
                                            <div class="input-group">
                                                <input type="password" name="currentPassword" class="form-control" id="currentPassword" required>
                                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">New Password</label>
                                            <div class="input-group">
                                                <input type="password" name="newPassword" class="form-control" id="newPassword" required>
                                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label">Confirm New Password</label>
                                            <div class="input-group">
                                                <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" required>
                                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <input type="text" name="realPassword" value="${sessionScope.account.password}" hidden="">
                                        <input type="text" name="accountId" value="${sessionScope.account.accountId}" hidden="">
                                        <div class="col-12 text-end">
                                            <button type="submit" class="btn btn-primary">
                                                <span class="btn-text">
                                                    <i class="fas fa-key me-2"></i>Update Password
                                                </span>
                                                <span class="btn-loader d-none">
                                                    <i class="fas fa-circle-notch fa-spin"></i>
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <footer class="footer bg-light py-5">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-4">
                        <h5 class="fw-bold mb-4">About Children Care</h5>
                        <p class="text-muted">Providing comprehensive healthcare services for children with care,
                            compassion, and expertise.</p>
                        <div class="social-links mt-4">
                            <a href="#" class="me-3"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="me-3"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="me-3"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <h5 class="fw-bold mb-4">Quick Links</h5>
                        <ul class="list-unstyled footer-links">
                            <li><a href="/services">Services</a></li>
                            <li><a href="/blogs">Blogs</a></li>
                            <li><a href="/contact">Contact</a></li>
                            <li><a href="/about">About Us</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h5 class="fw-bold mb-4">Contact Info</h5>
                        <ul class="list-unstyled contact-info">
                            <li><i class="fas fa-phone text-primary"></i> +1 234 567 890</li>
                            <li><i class="fas fa-envelope text-primary"></i> info@childrencare.com</li>
                            <li><i class="fas fa-location-dot text-primary"></i> 123 Healthcare St, Medical City</li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h5 class="fw-bold mb-4">Newsletter</h5>
                        <p class="text-muted">Subscribe for health tips and updates</p>
                        <form class="newsletter-form">
                            <div class="input-group">
                                <input type="email" class="form-control" placeholder="Your email">
                                <button class="btn btn-primary" type="submit">Subscribe</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="footer-bottom text-center mt-5 pt-4 border-top">
                    <p class="mb-0">� 2024 Children Care. All rights reserved.</p>
                </div>
            </div>
        </footer>

        <!-- Scripts -->
        <script>
            window.onload = function () {
                var message = '<%= request.getAttribute("ms") != null ? request.getAttribute("ms") : "" %>';
                var messageSuccess = '<%= request.getAttribute("msSuccess") != null ? request.getAttribute("msSuccess") : "" %>';

                if (message) {
                    alert(message);
                    window.location.href = "changePassword";
                } else if (messageSuccess) {
                    alert(messageSuccess);
                    window.location.href = "home";
                }
            };
        </script>

        <script>
            document.querySelectorAll(".toggle-password").forEach(function (button) {
                button.addEventListener("click", function () {
                    const passwordInput = this.previousElementSibling;
                    const icon = this.querySelector("i");

                    if (passwordInput.type === "password") {
                        passwordInput.type = "text";
                        icon.classList.remove("fa-eye");
                        icon.classList.add("fa-eye-slash");
                    } else {
                        passwordInput.type = "password";
                        icon.classList.remove("fa-eye-slash");
                        icon.classList.add("fa-eye");
                    }
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>