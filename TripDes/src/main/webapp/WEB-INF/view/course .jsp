<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Trip Table</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./favicon.ico" />
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>



        <!-- 이전에 제공한 JavaScript 코드 -->
        <script>
          // 페이지 로드가 완료되면 실행
          $(document).ready(function() {
             
          });
      </script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
        .form-control , .form-select {
          border-radius: 3px !important;
        }
        .form-select {
          width: 200px;
          flex: 0.3 !important;
        }
        .bx-link {
          background-image: url(./img/file.png);
          background-repeat: no-repeat;
          background-size: contain;
          display: block;
          width: 50px;
          height: 50px;
          opacity: 1;
          margin-top: 5px;
        }
        .course-item {
          margin-bottom: 30px;
        }
        #course-flters {
          padding: 0;
          margin: 0 auto 25px auto;
          list-style: none;
          text-align: center;
          background: white;
          border-radius: 50px;
          padding: 2px 15px;
        }
        #course-flters li {
          cursor: pointer;
          display: inline-block;
          padding: 8px 20px 12px 20px;
          font-size: 15px;
          font-weight: 500;
          line-height: 1;
          color: #444444;
          margin: 0 4px 8px 4px;
          transition: all ease-in-out 0.3s;
          border-radius: 50px;
          background: #f2f2f2;
          z-index: 3;
        }

        #course-flters li:hover,
        #course-flters li.filter-active {
          background: #e96b56;
          color: #fff;
        }

        #course-flters li:last-child {
          margin-right: 0;
        }
        .course-wrap {
          transition: 0.3s;
          position: relative;
          overflow: hidden;
          z-index: 1;
          background: rgba(84, 84, 84, 0.6);
        }

        .course-wrap::before {
          content: "";
          background: rgba(84, 84, 84, 0.6);
          position: absolute;
          left: 30px;
          right: 30px;
          top: 30px;
          bottom: 30px;
          transition: all ease-in-out 0.3s;
          z-index: 2;
          opacity: 0;
        }

        .course-wrap .course-info {
          opacity: 0;
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          text-align: center;
          z-index: 3;
          transition: all ease-in-out 0.3s;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        }

        .course-wrap .course-info::before {
          display: block;
          content: "";
          width: 48px;
          height: 48px;
          position: absolute;
          top: 35px;
          left: 35px;
          border-top: 3px solid #fff;
          border-left: 3px solid #fff;
          transition: all 0.5s ease 0s;
          z-index: 9994;
        }

        .course-wrap .course-info::after {
          display: block;
          content: "";
          width: 48px;
          height: 48px;
          position: absolute;
          bottom: 35px;
          right: 35px;
          border-bottom: 3px solid #fff;
          border-right: 3px solid #fff;
          transition: all 0.5s ease 0s;
          z-index: 9994;
        }

        .course-wrap .course-info h4 {
          font-size: 20px;
          color: #fff;
          font-weight: 600;
        }

        .course-wrap .course-info p {
          color: #ffffff;
          font-size: 14px;
          text-transform: uppercase;
          padding: 0;
          margin: 0;
        }

        .course-wrap .course-links {
          text-align: center;
          z-index: 4;
        }

        .course-wrap .course-links a {
          color: #fff;
          margin: 0 2px;
          font-size: 28px;
          display: inline-block;
          transition: 0.3s;
        }

        .course-wrap .course-links a:hover {
          color: #e96b56;
        }

        .course-wrap:hover::before {
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          opacity: 1;
        }

        .course-wrap:hover .course-info {
          opacity: 1;
        }

        .course-wrap:hover .course-info::before {
          top: 15px;
          left: 15px;
        }

        .course-wrap:hover .course-info::after {
          bottom: 15px;
          right: 15px;
        }

        .back-to-top {
          position: fixed;
          visibility: hidden;
          opacity: 0;
          right: 15px;
          bottom: 15px;
          z-index: 996;
          background: #e96b56;
          width: 40px;
          height: 40px;
          border-radius: 4px;
          transition: all 0.4s;
        }

        .back-to-top i {
          font-size: 28px;
          color: #fff;
          line-height: 0;
        }

        .back-to-top:hover {
          background: #ee8b7a;
          color: #fff;
        }

        .back-to-top.active {
          visibility: visible;
          opacity: 1;
        }
        </style>
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-write bg-write">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.html">Trip Table</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="about.html">이용안내</a></li>
                            <li class="nav-item"><a class="nav-link" href="course.html">코스추천</a></li>
                            <li class="nav-item"><a class="nav-link" href="trip-plan.html">여행계획</a></li>
                            <li class="nav-item"><a class="nav-link" href="pricing.html">숙소예약</a></li>
                            <li class="nav-item"><a class="nav-link" href="pricing.html">마이페이지</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span>사용자</span> 님</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="blog-home.html">My Trip</a></li>
                                    <li><a class="dropdown-item" href="blog-post.html">프로필 설정</a></li>
                                    <li><a class="dropdown-item" href="blog-home.html">회원 탈퇴</a></li>
                                    <li><a class="dropdown-item" href="./login.html">로그인</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="py-3 bg-light">
                <div class="container px-3 my-3">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-10 col-xl-7">
                            <div class="text-center">
                              <h2 class="display-7 fw-bolder text-dark mb-2">여행의 마법,</h2>
                              <h2 class="display-5 fw-bolder text-dark mb-3">우리만의 추억으로</h2>
                              <p class="fw-light text-dark-50 mb-4" style="word-break: break-word;">우리의 여행 코스 추천은 단순한 경로가 아닌, 감동과 기쁨이 깃든 일정으로 여러분을 초대합니다. 그곳에서 펼쳐지는 풍경과 만나는 사람들, 맛보는 음식까지, 모두가 우리만의 특별한 추억으로 남을 것입니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Blog preview section-->
            <section class="py-1">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="input-group mb-5">
                          <label for="portfolio-filter-select"></label>
                          <select id="portfolio-filter-select" class="form-select mx-1">
                              <option value="*" selected>All</option>
                              <option value=".filter-app">App</option>
                              <option value=".filter-card">Card</option>
                              <option value=".filter-web">Web</option>
                          </select>
                          <input type="text" id="course-search" class="form-control mx-3" placeholder="검색어를 입력하세요">
                          <div class="input-group-append">
                              <button class="btn btn-success px-5" type="button" id="search-button">검색</button>
                          </div>
                        </div>
   

                    </div>
                    <div class="row course-container">

                      <div class="col-lg-4 col-md-6 course-item filter-app">
                        <div class="course-wrap">
                          <img src="./img/course/course-1.jpg" class="img-fluid" alt="">
                          <div class="course-info">
                            <h4>App 1</h4>
                            <p>App</p>
                            <div class="course-links">
                              <a href="./img/course/course-1.jpg" data-gallery="courseGallery" class="course-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                              <a href="course-details.html" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                          </div>
                        </div>
                      </div>
            
                      <div class="col-lg-4 col-md-6 course-item filter-web">
                        <div class="course-wrap">
                          <img src="./img/course/course-2.jpg" class="img-fluid" alt="">
                          <div class="course-info">
                            <h4>Web 3</h4>
                            <p>Web</p>
                            <div class="course-links">
                              <a href="./img/course/course-2.jpg" data-gallery="courseGallery" class="course-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>
                              <a href="course-details.html" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                          </div>
                        </div>
                      </div>
            
                      <div class="col-lg-4 col-md-6 course-item filter-app">
                        <div class="course-wrap">
                          <img src="./img/course/course-3.jpg" class="img-fluid" alt="">
                          <div class="course-info">
                            <h4>App 2</h4>
                            <p>App</p>
                            <div class="course-links">
                              <a href="./img/course/course-3.jpg" data-gallery="courseGallery" class="course-lightbox" title="App 2"><i class="bx bx-plus"></i></a>
                              <a href="course-details.html" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                          </div>
                        </div>
                      </div>
            
                      <div class="col-lg-4 col-md-6 course-item filter-card">
                        <div class="course-wrap">
                          <img src="./img/course/course-4.jpg" class="img-fluid" alt="">
                          <div class="course-info">
                            <h4>Card 2</h4>
                            <p>Card</p>
                            <div class="course-links">
                              <a href="./img/course/course-4.jpg" data-gallery="courseGallery" class="course-lightbox" title="Card 2"><i class="bx bx-plus"></i></a>
                              <a href="course-details.html" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                          </div>
                        </div>
                      </div>
            
                      <div class="col-lg-4 col-md-6 course-item filter-web">
                        <div class="course-wrap">
                          <img src="./img/course/course-5.jpg" class="img-fluid" alt="">
                          <div class="course-info">
                            <h4>Web 2</h4>
                            <p>Web</p>
                            <div class="course-links">
                              <a href="./img/course/course-5.jpg" data-gallery="courseGallery" class="course-lightbox" title="Web 2"><i class="bx bx-plus"></i></a>
                              <a href="course-details.html" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                          </div>
                        </div>
                      </div>
            
                      <div class="col-lg-4 col-md-6 course-item filter-app">
                        <div class="course-wrap">
                          <img src="./img/course/course-6.jpg" class="img-fluid" alt="">
                          <div class="course-info">
                            <h4>App 3</h4>
                            <p>App</p>
                            <div class="course-links">
                              <a href="./img/course/course-6.jpg" data-gallery="courseGallery" class="course-lightbox" title="App 3"><i class="bx bx-plus"></i></a>
                              <a href="course-details.html" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                          </div>
                        </div>
                      </div>
            
                      <div class="col-lg-4 col-md-6 course-item filter-card">
                        <div class="course-wrap">
                          <img src="./img/course/course-7.jpg" class="img-fluid" alt="">
                          <div class="course-info">
                            <h4>Card 1</h4>
                            <p>Card</p>
                            <div class="course-links">
                              <a href="./img/course/course-7.jpg" data-gallery="courseGallery" class="course-lightbox" title="Card 1"><i class="bx bx-plus"></i></a>
                              <a href="course-details.html" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                          </div>
                        </div>
                      </div>
            
                      <div class="col-lg-4 col-md-6 course-item filter-card">
                        <div class="course-wrap">
                          <img src="./img/course/course-8.jpg" class="img-fluid" alt="">
                          <div class="course-info">
                            <h4>Card 3</h4>
                            <p>Card</p>
                            <div class="course-links">
                              <a href="./img/course/course-8.jpg" data-gallery="courseGallery" class="course-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                              <a href="course-details.html" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                          </div>
                        </div>
                      </div>
            
                      <div class="col-lg-4 col-md-6 course-item filter-web">
                        <div class="course-wrap">
                          <img src="./img/course/course-9.jpg" class="img-fluid" alt="">
                          <div class="course-info">
                            <h4>Web 3</h4>
                            <p>Web</p>
                            <div class="course-links">
                              <a href="./img/course/course-9.jpg" data-gallery="courseGallery" class="course-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>
                              <a href="course-details.html" title="More Details"><i class="bx bx-link"></i></a>
                            </div>
                          </div>
                        </div>
                      </div>
            
                    </div>
                    
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2023</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center active"><i class="bi bi-arrow-up-short"></i></a>
        <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <!-- 부트스트랩 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
