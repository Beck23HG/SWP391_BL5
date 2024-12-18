<%-- 
    Document   : SliderList
    Created on : Dec 1, 2024, 10:04:22 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sliders Management - Healthcare Admin</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Manager/Dashboard/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Manager/Dashboard/assets/css/sliders.css">
        <style>
            .search-button {
                background-color: #007bff; /* Màu nền nút */
                color: white;              /* Màu chữ */
                font-size: 16px;           /* Kích thước chữ */
                border: none;              /* Không viền */
                padding: 10px 20px;        /* Khoảng cách trong nút */
                border-radius: 25px;       /* Bo góc tròn */
                cursor: pointer;          /* Con trỏ chuột khi di chuyển qua nút */
                transition: background-color 0.3s, transform 0.3s; /* Hiệu ứng chuyển màu và phóng to */
            }

            .search-button:hover {
                background-color: #0056b3; /* Màu nền khi hover */
                transform: scale(1.05);     /* Phóng to khi hover */
            }

            .search-button:active {
                background-color: #004085; /* Màu nền khi nhấn */
            }
            .view-button{
                text-decoration: none; /* Loại bỏ underline */
                color: inherit; /* Giữ màu sắc của text giống như các nút khác */
            }
            .view-button:hover{
                text-decoration: none;
            }
        </style>
    </head>

    <body>
        <nav class="sidebar">
            <div class="sidebar-header">
                <div class="sidebar-logo">HealthCare Manager</div>
            </div>

            <!-- Manager Section -->
            <div class="nav-section">
                <div class="nav-section-title">Manager Tools</div>
                <a href="Manager/Dashboard/postList" class="nav-item">
                    <i class="fas fa-newspaper"></i>
                    <span>Posts</span>
                </a>
                <a href="sliderList" class="nav-item">
                    <i class="fas fa-images"></i>
                    <span>Sliders</span>
                </a>
                <a href="ListService" class="nav-item">
                    <i class="fas fa-list"></i>
                    <span>Services List</span>
                </a>
                <a href="customerList" class="nav-item">
                    <i class="fas fa-users"></i>
                    <span>Customer List</span>
                </a>
            </div>

        </nav>

        <!-- Main Content Area -->
        <div class="main-content">
            <div class="top-nav">
                <div class="menu-toggle">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <div class="search-bar">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search...">
                </div>
                <div class="user-menu">
                    <div class="user-profile-wrapper">
                        <div class="user-profile">
                            <div class="user-avatar">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="user-info">
                                <span class="user-name">${sessionScope.account.person.personName}</span>
                                <span class="user-role">Manager</span>
                            </div>
                        </div>

                    </div>
                    <div class="user-profile">
                        <a href="logout" style="padding: 10% 0">
                            <i class="fas fa-sign-out-alt"></i>
                            <span>Sign Out</span>
                        </a>
                    </div>
                    <div class="theme-toggle" title="Toggle theme">
                    </div>
                </div>
            </div>

            <div class="page-header">
                <div class="header-content">
                    <h1>Sliders Management</h1>
                    <a href="addSlider" class="btn-primary view-button">
                        <i class="fas fa-plus"></i>
                        New Slider
                    </a>
                </div>

                <!-- Filter Section -->
                <form action="sliderList" method="get">
                    <div class="filters-section">
                        <div class="search-filters">
                            <div class="search-bar">
                                <i class="fas fa-search"></i>
                                <input type="text" name="title" placeholder="Search by title...">
                            </div>
                            <div class="filter-group">
                                <select name="status" class="filter-select" id="statusFilter">
                                    <option value="">All Status</option>
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                            </div>
                            <div>
                                <input type="submit" value="Search" class="search-button">
                            </div>
                        </div>
                    </div>
                </form>

            </div>

            <!-- Sliders Grid -->
            <div class="sliders-grid">
                <c:forEach items="${sliderList}" var="s">
                    <div class="slider-card">
                        <div class="slider-image">
                            <img src="assets/images/Slider/${s.image}" alt="${s.title}">
                        </div>
                        <div class="slider-content">
                            <div class="slider-header">
                                <h3 class="slider-title">${s.title}</h3>
                                <span>
                                    ${s.status eq 1 ? "Active" : "Inactive"}
                                </span>
                            </div>
                            <div class="slider-backlink">
                                ${s.backlink}
                            </div>
                            <div class="slider-actions">
                                <a href="sliderDetail?sliderId=${s.sliderId}" class="action-btn view view-button">
                                    <i class="fas fa-eye"></i>
                                    View
                                </a>
                                <form action="editSlider" method="get" >
                                    <input type="hidden" name="sliderId" value="${s.sliderId}">
                                    <a class="action-btn edit view-button" href="#" onclick="this.closest('form').submit(); return false;">
                                        <i class="fas fa-edit"></i>
                                        Edit
                                    </a>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>

        </div>


        <script src="${pageContext.request.contextPath}/Manager/Dashboard/assets/js/main.js"></script>
        <script>
            window.onload = function () {
            var message = '<%= session.getAttribute("notificationErr") != null ? session.getAttribute("notificationErr") : "" %>';
                if (message) {
                    alert(message);

                    window.location.href = "ClearSessionNotificationServlet";
                }
            };
        </script>
    </body>

</html>
