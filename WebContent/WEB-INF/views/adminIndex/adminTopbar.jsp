<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>


<!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>


                    <!-- Topbar Navbar -->
                     <div>
                       <a href="/admin/info"><h3>KHerb</h3></a>
                   </div>
                   
                    
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - User Information 로그아웃 -->
                        <li class="nav-item ">
                            <a class="nav-link " href="/admin/logout" id="userDropdown" alt="로그아웃">
                                <i class="fas fa-sign-out-alt mr-2 text-gray-600"></i>
                                <span class=" d-none d-lg-inline text-gray-600">로그아웃</span>
                            </a>
                        </li>
                        
                    </ul>

                </nav>
                <!-- End of Topbar -->



</body>
</html>