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
            /* Định dạng chung cho form */
            form {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Định dạng cho các nhóm form */
            .form-group {
                margin-bottom: 15px;
            }

            /* Định dạng cho các label */
            label {
                font-size: 14px;
                font-weight: bold;
                color: #333;
                display: block;
                margin-bottom: 5px;
            }

            /* Định dạng cho các input text và file */
            input[type="text"],
            input[type="file"],
            input[type="url"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
                margin-bottom: 10px;
                box-sizing: border-box;
            }

            /* Định dạng cho các radio buttons */
            input[type="radio"] {
                margin-right: 5px;
            }

            /* Định dạng cho các button submit */
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                width: 100%;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            /* Định dạng cho các section chọn trạng thái radio */
            .d-flex {
                display: flex;
                align-items: center;
            }

            .me-4 {
                margin-right: 20px;
            }

        </style>
        <script>
            window.onload = function () {
                var message = '<%= request.getAttribute("ms") != null ? request.getAttribute("ms") : "" %>';
                if (message) {
                    alert(message);

                    window.location.href = "sliderList";
                }
            };
        </script>
    </head>

    <body>
        <nav class="sidebar">
            <div class="sidebar-header">
                <div class="sidebar-logo">HealthCare Manager</div>
            </div>

            <!-- Manager Section -->
            <div class="nav-section">
                <div class="nav-section-title">Manager Tools</div>
                <a href="postList" class="nav-item">
                    <i class="fas fa-newspaper"></i>
                    <span>Posts</span>
                </a>
                <a href="sliderList" class="nav-item">
                    <i class="fas fa-images"></i>
                    <span>Sliders</span>
                </a>
                <a href="#" class="nav-item">
                    <i class="fas fa-list"></i>
                    <span>Services List</span>
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
                </div>
            </div>

            <form action="editSlider" method="post" onsubmit="showAlert();">
                <div class="form-group">
                    <label for="sliderTitle">Title</label>
                    <input type="text" name="title" value="${slider.title}" required="">
                </div>
                
                <div class="form-group">
                    <label for="sliderBacklink">Image</label>
                    <div class="image-preview">
                        <img id="preview" src="assets/images/Slider/${slider.image}" alt="Preview Image" style="object-fit: cover;">
                    </div>
                    <input type="file" name="image" id="sliderBacklink" accept="image/*" onchange="showPreview(event)">
                </div>
                <div class="form-group">
                    <label for="sliderBacklink">Backlink URL</label>
                    <input type="text" name="backlink" value="${slider.backlink}" required="">
                </div>
                <div class="form-group">
                    <label for="sliderBacklink">Description</label>
                    <input type="text" name="description" value="${slider.description}" required="">
                </div>
                <div class="form-group">
                    <label for="sliderBacklink">Status</label>
                    <div class="d-flex align-items-center">
                        <label class="me-4 d-flex align-items-center">
                            <input type="radio" name="status" value="1" ${slider.status eq "1" ? "checked" : ""}> Active
                        </label>
                        <label class="d-flex align-items-center">
                            <input type="radio" name="status" value="0" ${slider.status eq "0" ? "checked" : ""}> Inactive
                        </label>
                    </div>
                </div>
                <input type="text" name="id" value="${slider.sliderId}" hidden="">
                <input type="submit" value="Edit">
            </form>

        </div>

        <script>
            function showPreview(event) {
                const file = event.target.files[0]; // Lấy tệp được chọn
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        // Đặt src của ảnh preview thành dữ liệu từ tệp
                        document.getElementById('preview').src = e.target.result;
                    }
                    reader.readAsDataURL(file); // Đọc tệp dưới dạng URL
                }
            }
        </script>
        <script src="${pageContext.request.contextPath}/Manager/Dashboard/assets/js/main.js"></script>
    </body>

</html>