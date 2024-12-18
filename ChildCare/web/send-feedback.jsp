
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Feedback - Children Care System</title>
    <meta name="description" content="Share your experience with our services">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/images/favicon.ico">

    <!-- CSS Files -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <link rel="stylesheet" href="assets/css/feedback.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<body>
    <!-- Include Header -->
    <header class="header fixed-top">
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
                            <a class="nav-link active" href="index.html">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <button class="nav-link dropdown-toggle btn btn-link" data-bs-toggle="dropdown">
                                <a style="text-decoration: none; color: inherit;" href="services.html">Services</a>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/services/pediatric">Pediatric Care</a></li>
                                <li><a class="dropdown-item" href="/services/vaccination">Vaccination</a></li>
                                <li><a class="dropdown-item" href="/services/development">Child Development</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/doctors">Our Doctors</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="blogs.html">Blogs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/contact">Contact</a>
                        </li>
                        <li class="nav-item ms-lg-3">
                            <a class="btn btn-primary rounded-pill px-4" href="appointment.html">
                                <i class="fas fa-calendar-check me-2"></i>Book Appointment
                            </a>
                        </li>
                        <li class="nav-item ms-lg-2">
                            <a class="btn btn-outline-primary rounded-pill px-4" href="login.html">
                                <i class="fas fa-user me-2"></i>Login
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <!-- Main Content -->
    <main id="main-content">
        <!-- Feedback Hero Section -->
        <section class="feedback-hero">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active">Service Feedback</li>
                            </ol>
                        </nav>
                        <h1 class="display-4 fw-bold mb-4">Share Your Experience</h1>
                        <p class="lead mb-4">Your feedback helps us improve our services and provide better care.</p>
                    </div>
                    <div class="col-lg-6">
                        <img src="assets/images/feedback-hero.jpg" alt="Feedback" class="img-fluid rounded-4">
                    </div>
                </div>
            </div>
        </section>

        <!-- Feedback Form Section -->
        <section class="feedback-form-section py-5">
            <div class="container">
                <div class="row">
                    <!-- Main Feedback Form -->
                    <div class="col-lg-8">
                        <div class="feedback-card">
                            <form id="feedbackForm" class="needs-validation" novalidate>
                                <!-- Contact Information -->
                                <div class="form-section mb-5">
                                    <h3 class="section-title">Contact Information</h3>
                                    <div class="row g-4">
                                        <div class="col-md-6">
                                            <label class="form-label">Full Name</label>
                                            <input type="text" class="form-control" required>
                                            <div class="invalid-feedback">Please enter your name</div>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Gender</label>
                                            <select class="form-select" required>
                                                <option value="">Select gender</option>
                                                <option value="male">Male</option>
                                                <option value="female">Female</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Email Address</label>
                                            <input type="email" class="form-control" required>
                                            <div class="invalid-feedback">Please enter valid email</div>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Mobile Number</label>
                                            <input type="tel" class="form-control" required>
                                            <div class="invalid-feedback">Please enter mobile number</div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Service Selection -->
                                <div class="form-section mb-5">
                                    <h3 class="section-title">Service Details</h3>
                                    <div class="row g-4">
                                        <div class="col-md-6">
                                            <label class="form-label">Service Category</label>
                                            <select class="form-select" id="serviceCategory" required>
                                                <option value="">Select service category</option>
                                                <option value="pediatric">Pediatric Care</option>
                                                <option value="vaccination">Vaccination</option>
                                                <option value="development">Child Development</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Specific Service</label>
                                            <select class="form-select" id="specificService">
                                                <option value="">Select specific service</option>
                                                <!-- Will be populated based on category -->
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!-- Rating and Feedback -->
                                <div class="form-section mb-5">
                                    <h3 class="section-title">Your Feedback</h3>
                                    <div class="row g-4">
                                        <div class="col-12">
                                            <label class="form-label">Rate your experience</label>
                                            <div class="star-rating">
                                                <input type="radio" name="rating" value="5" id="5"><label for="5">?</label>
                                                <input type="radio" name="rating" value="4" id="4"><label for="4">?</label>
                                                <input type="radio" name="rating" value="3" id="3"><label for="3">?</label>
                                                <input type="radio" name="rating" value="2" id="2"><label for="2">?</label>
                                                <input type="radio" name="rating" value="1" id="1"><label for="1">?</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <label class="form-label">Your Comments</label>
                                            <textarea class="form-control" rows="4" required></textarea>
                                            <div class="invalid-feedback">Please provide your feedback</div>
                                        </div>
                                        <div class="col-12">
                                            <label class="form-label">Attach Images (optional)</label>
                                            <input type="file" class="form-control" multiple accept="image/*">
                                        </div>
                                    </div>
                                </div>

                                <!-- Submit Button -->
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary btn-lg rounded-pill px-5">
                                        <i class="fas fa-paper-plane me-2"></i>Submit Feedback
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Sidebar -->
                    <div class="col-lg-4">
                        <!-- Service Search -->
                        <div class="sidebar-card mb-4">
                            <h3><i class="fas fa-search me-2"></i>Search Services</h3>
                            <div class="search-box">
                                <input type="text" class="form-control" placeholder="Search services...">
                            </div>
                        </div>

                        <!-- Service Categories -->
                        <div class="sidebar-card mb-4">
                            <h3><i class="fas fa-list me-2"></i>Service Categories</h3>
                            <ul class="list-unstyled category-list">
                                <li><a href="#">Pediatric Care</a></li>
                                <li><a href="#">Vaccination</a></li>
                                <li><a href="#">Child Development</a></li>
                                <li><a href="#">Emergency Care</a></li>
                            </ul>
                        </div>

                        <!-- Contact Information -->
                        <div class="sidebar-card">
                            <h3><i class="fas fa-phone me-2"></i>Contact Us</h3>
                            <ul class="list-unstyled contact-info">
                                <li><i class="fas fa-phone"></i> +1 234 567 890</li>
                                <li><i class="fas fa-envelope"></i> support@childrencare.com</li>
                                <li><i class="fas fa-map-marker-alt"></i> 123 Healthcare Street</li>
                            </ul>
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
                    <p class="text-muted">Providing comprehensive healthcare services for children with care, compassion, and expertise.</p>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/feedback.js"></script>
</body>

</html>