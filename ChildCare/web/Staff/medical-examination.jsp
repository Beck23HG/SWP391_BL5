<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Medical Examinations - Healthcare Admin</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link href="../Admin/assets/css/style.css" rel="stylesheet" type="text/css" />
            <link href="../Admin/assets/css/feedbacks.css" rel="stylesheet" type="text/css" />
            <link href="../Admin/assets/css/reservation.css" rel="stylesheet" type="text/css" />
            <link href="assetsStaff/medical-examination.css" rel="stylesheet" type="text/css" />
            <style>
                /* Modal styles */
                
                #addPrescriptionModal {
                    display: none;
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    z-index: 1000;
                    background: #fff;
                    border-radius: 10px;
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                    width: 40%;
                    padding: 20px;
                }
                
                #addPrescriptionModal .modal-content h2 {
                    margin-top: 0;
                }
                
                #addPrescriptionModal form div {
                    margin-bottom: 15px;
                }
                
                #addPrescriptionModal form input,
                #addPrescriptionModal form textarea {
                    width: 100%;
                    padding: 10px;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                }
                
                #addPrescriptionModal form button {
                    margin-top: 10px;
                    padding: 10px 15px;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                }
                
                #addPrescriptionModal form button[type="submit"] {
                    background-color: #28a745;
                    color: #fff;
                }
                
                #addPrescriptionModal form button[type="button"] {
                    background-color: #dc3545;
                    color: #fff;
                }
                
                #modal-overlay {
                    display: none;
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0, 0, 0, 0.5);
                    z-index: 999;
                }
                /* CSS cho nút Apply Filter */
                
                .filter-section button[type="submit"] {
                    background-color: #007bff;
                    /* Màu nền xanh */
                    color: #fff;
                    /* Màu chữ trắng */
                    padding: 10px 20px;
                    /* Khoảng cách bên trong nút */
                    font-size: 16px;
                    /* Kích thước chữ */
                    border: none;
                    /* Xóa viền mặc định */
                    border-radius: 5px;
                    /* Góc bo tròn */
                    cursor: pointer;
                    /* Con trỏ dạng bàn tay */
                    transition: background-color 0.3s ease;
                    /* Hiệu ứng chuyển màu */
                }
                
                .filter-section button[type="submit"]:hover {
                    background-color: #0056b3;
                    /* Màu nền khi hover */
                }
            </style>
        </head>

        <body>
            <nav class="sidebar">
                <div class="sidebar-header">
                    <div class="sidebar-logo">HealthCare Admin</div>
                </div>

                <!-- Staff Section (Same as previous HTML) -->
                <div class="nav-section">
                    <div class="nav-section-title">Staff Management</div>
                    <a href="reservationlist" class="nav-item">
                        <i class="fas fa-calendar-check"></i>
                        <span>Reservations</span>
                    </a>
                    <a href="medicalexamination" class="nav-item active">
                        <i class="fas fa-stethoscope"></i>
                        <span>Medical Examinations</span>
                    </a>
                </div>
            </nav>

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
                                    <span class="user-role">Staff ID${sessionScope.account.person.personId}</span>
                                </div>
                            </div>

                        </div>
                        <div class="user-profile">
                            <a href="../logout" style="padding: 10% 0">
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
                        <h1>Medical Examinations</h1>
                        <button onclick="openAddPrescriptionModal()" style="padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">
                    <i class="fas fa-plus"></i> Add New Prescription
                </button>
                    </div>
                </div>
                <c:if test="${not empty message}">
                    <div style="color: green;">${message}</div>
                </c:if>
                <c:if test="${not empty error}">
                    <div style="color: red;">${error}</div>
                </c:if>
                <div class="medical-exam-container">
                    <!-- Bộ lọc dữ liệu -->
                    <div class="filter-section">
                        <form action="medicalexamination" method="post">
                            <!--                    <select name="serviceFilter">
                        <option value="">All Service</option>
                        <c:forEach var="service" items="${services}">
                            <option value="${service.serviceName}">${service.serviceName}</option>
                        </c:forEach>
                    </select>-->
                            <input type="date" name="dateFrom" placeholder="From Date">
                            <input type="date" name="dateTo" placeholder="To Date">
                            <input type="text" name="medicineFilter" placeholder="Medicine Name">
                            <input type="text" name="patientNameFilter" placeholder="Patient Name">
                            <button type="submit">Apply Filter</button>
                        </form>
                    </div>

                    <!-- Bảng lịch sử khám bệnh -->
                    <table class="medical-history-table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Patient Name</th>
                                <!--                        <th>Services</th>-->
                                <th>Medicines Name</th>
                                <th>Symptoms</th>
                                <th>Diagnosis</th>
                                <th class="actions-column">Notes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="history" items="${medicalHistory}">
                                <tr>
                                    <td>${history.examinationDate}</td>
                                    <td>${history.customer.personName}</td>
                                    <!--                            <td>${history.service.serviceName}</td>-->
                                    <td>${history.medicine.name}</td>
                                    <td>${history.symptoms}</td>
                                    <td>${history.diagnosis}</td>
                                    <td>${history.notes}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Modal chỉnh sửa -->
            <div id="addPrescriptionModal" style="display:none;">
                <div class="modal-content">
                    <h2>Add New Prescription</h2>
                    <form method="post" action="medicalexamination">
                        <input type="hidden" name="action" value="addMedicalExamination">

                        <div>
                            <label for="reservationId">Reservation ID</label>
                            <input type="text" id="reservationId" name="reservationId" pattern="[1-9][0-9]*" maxlength="100" required>
                        </div>
                        <div>
                            <label for="customerId">Customer ID</label>
                            <input type="text" id="customerId" name="customerId" pattern="[1-9][0-9]*" maxlength="100" required>
                        </div>
                        <div>
                            <label for="serviceId">Service</label>
                            <select id="serviceId" name="serviceId" required>
                            <c:forEach var="service" items="${services}">
                                <option value="${service.serviceId}">${service.serviceName}</option>
                            </c:forEach>
                        </select>
                        </div>
                        <!-- Staff ID và Doctor ID tự động lấy từ session -->
                        <input type="hidden" id="staffId" name="staffId" value="${sessionScope.account.person.personId}">
                        <input type="hidden" id="doctorId" name="doctorId" value="${sessionScope.account.person.personId}">

                        <div>
                            <label for="symptoms">Symptoms</label>
                            <input type="text" id="symptoms" name="symptoms" maxlength="100" required>
                        </div>
                        <div>
                            <label for="diagnosis">Diagnosis</label>
                            <input type="text" id="diagnosis" name="diagnosis" maxlength="100" required>
                        </div>
                        <div>
                            <label for="notes">Notes</label>
                            <textarea id="notes" name="notes" maxlength="100"></textarea>
                        </div>
                        <div>
                            <label for="examinationFee">Examination Fee</label>
                            <input type="number" id="examinationFee" name="examinationFee" step="any" min="0.01" required>
                        </div>
                        <div>
                            <label for="medicineId">Medicine</label>
                            <select id="medicineId" name="medicineId" required>
                            <c:forEach var="medicine" items="${medicines}">
                                <option value="${medicine.medicineId}">${medicine.name}</option>
                            </c:forEach>
                        </select>
                        </div>
                        <div>
                            <label for="dosage">Dosage</label>
                            <input type="text" id="dosage" name="dosage" maxlength="100" required>
                        </div>
                        <div>
                            <label for="prescriptionNote">Prescription Note</label>
                            <textarea id="prescriptionNote" name="prescriptionNote" maxlength="100"></textarea>
                        </div>
                        <div>
                            <label for="totalCost">Total Cost</label>
                            <input type="number" id="totalCost" name="totalCost" step="any" min="0.01" required>
                        </div>
                        <div>
                            <button type="submit">Save</button>
                            <button type="button" onclick="closeAddPrescriptionModal()">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                function openAddPrescriptionModal() {
                    document.getElementById('addPrescriptionModal').style.display = 'block';
                    document.getElementById('modal-overlay').style.display = 'block';
                }

                function closeAddPrescriptionModal() {
                    document.getElementById('addPrescriptionModal').style.display = 'none';
                    document.getElementById('modal-overlay').style.display = 'none';
                }

                // Form validation
                document.querySelector('form').addEventListener('submit', function(e) {
                    e.preventDefault();

                    // Get form elements and trim values
                    const reservationId = document.getElementById('reservationId').value.trim();
                    const customerId = document.getElementById('customerId').value.trim();
                    const symptoms = document.getElementById('symptoms').value.trim();
                    const diagnosis = document.getElementById('diagnosis').value.trim();
                    const notes = document.getElementById('notes').value.trim();
                    const dosage = document.getElementById('dosage').value.trim();
                    const prescriptionNote = document.getElementById('prescriptionNote').value.trim();
                    const examinationFee = parseFloat(document.getElementById('examinationFee').value.trim());
                    const totalCost = parseFloat(document.getElementById('totalCost').value.trim());

                    // Validate Reservation ID and Customer ID (positive integers only)
                    if (!(/^\d+$/.test(reservationId)) || parseInt(reservationId) <= 0) {
                        alert('Reservation ID must be a positive integer');
                        return;
                    }

                    if (!(/^\d+$/.test(customerId)) || parseInt(customerId) <= 0) {
                        alert('Customer ID must be a positive integer');
                        return;
                    }

                    // Validate text fields (max 100 characters)
                    const textFields = [{
                        value: symptoms,
                        name: 'Symptoms'
                    }, {
                        value: diagnosis,
                        name: 'Diagnosis'
                    }, {
                        value: notes,
                        name: 'Notes'
                    }, {
                        value: dosage,
                        name: 'Dosage'
                    }, {
                        value: prescriptionNote,
                        name: 'Prescription Note'
                    }];

                    for (let field of textFields) {
                        if (field.value.length > 100) {
                            alert(`${field.name} must not exceed 100 characters`);
                            return;
                        }
                    }

                    // Validate numeric fields (must be positive numbers)
                    if (isNaN(examinationFee) || examinationFee <= 0) {
                        alert('Examination Fee must be a positive number');
                        return;
                    }

                    if (isNaN(totalCost) || totalCost <= 0) {
                        alert('Total Cost must be a positive number');
                        return;
                    }

                    // If all validations pass, submit the form
                    this.submit();
                });

                // Auto trim input values on blur
                const inputs = document.querySelectorAll('input, textarea');
                inputs.forEach(input => {
                    input.addEventListener('blur', function() {
                        this.value = this.value.trim();
                    });
                });
            </script>
        </body>

        </html>