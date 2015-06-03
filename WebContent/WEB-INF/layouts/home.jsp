<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

        <!-- Page Canvas-->
        <div id="page-canvas">
            <!--Off Canvas Navigation-->
            <nav class="off-canvas-navigation">
                <header>Navigation</header>
                <div class="main-navigation navigation-off-canvas"></div>
            </nav>
            <!--end Off Canvas Navigation-->
            <!--Page Content-->
            <div id="page-content">
                <!--Hero Image-->
                <section class="hero-image search-filter-middle height-500">
                    <div class="inner">
                        <div class="container">
                            <h1>Order food for your party in just one click!</h1>
                            
                        </div>
                   
                        <button type="submit" class="btn btn-default btn-large">How it Works</button>
                    </div>
                    <div class="background">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/restaurant-bg.jpg" alt="">
                    </div>
                </section>
                <!--end Hero Image-->
                
                <!--Why Us-->
                <section id="why-us" class="block">
                    <div class="container">
                        <header><h2>Why Choose CaterRequest?</h2></header>
                        <div class="row">
                            <div class=" col-sm-4">
                                <div class="feature-box">
                                    <i class="fa fa-thumbs-up"></i>
                                    <div class="description">
                                        <h3>Lorem ipsum dolor </h3>
                                        <p>
                                            Praesent tempor a erat in iaculis. Phasellus vitae libero libero. Vestibulum ante
                                            ipsum primis in faucibus orci luctus et ultrices posuere cubilia
                                        </p>
                                    </div>
                                </div>
                                <!--/.feature-box-->
                            </div>
                            <!--/.col-md-4-->
                            <div class=" col-sm-4">
                                <div class="feature-box">
                                    <i class="fa fa-folder"></i>
                                    <div class="description">
                                        <h3>Etiam vehicula felis a ipsum</h3>
                                        <p>
                                            Pellentesque nisl quam, aliquet sed velit eu, varius condimentum nunc.
                                            Nunc vulputate turpis ut erat egestas, vitae rutrum sapien varius.
                                        </p>
                                    </div>
                                </div>
                                <!--/.feature-box-->
                            </div>
                            <!--/.col-md-4-->
                            <div class=" col-sm-4">
                                <div class="feature-box">
                                    <i class="fa fa-money"></i>
                                    <div class="description">
                                        <h3>Donec dolor justo, volutpat </h3>
                                        <p>
                                            Maecenas quis ipsum lectus. Fusce molestie, metus ut consequat pulvinar,
                                            ipsum quam condimentum leo, sit amet auctor lacus nulla at felis.
                                        </p>
                                    </div>
                                </div>
                                <!--/.feature-box-->
                            </div>
                            <!--/.col-md-4-->
                        </div>
                    </div>
                </section>
                <!--end Why Us-->

                <!--Subscribe-->
                <!-- Search For Restaurants -->
                <section id="main-search" class="block">
                    <div class="container">
                        <header><h2>Search</h2></header>
                        <form class="subscribe form-inline border-less-inputs" action="${pageContext.request.contextPath}/search" method="GET" role="form">
                            <div class="form-group">
                                <input type="text" class="form-control" name="zip_code" id="zip_code" placeholder="Enter ZIP Code for restaurants nearby">
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-default btn-large">Search<i class="fa fa-angle-right"></i></button>
                                </span>
                            </div>
                        </form>
                        <!--/.subscribe-->
                    </div>
                    <!--/.container-->
                </section>
                <!--end Subscribe-->

                
<section id="featured" class="block equal-height">
                    <div class="container">
                        <header><h2>Featured</h2></header>
                        <div class="row">
                            <div class=" col-sm-3">
                                <div class="item">
                                    <div class="image">
                                        <div class="quick-view"><i class="fa fa-eye"></i><span>Quick View</span></div>
                                        <a href="item-detail.html">
                                           
                                            
                                            <div class="icon">
                                                <i class="fa fa-thumbs-up"></i>
                                            </div>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/items/1.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="wrapper">
                                        <a href="item-detail.html"><h3>Steak House Restaurant</h3></a>
                                        <figure>63 Birch Street</figure>
                                        <div class="info">
                                            <div class="type">
                                                <i><img src="${pageContext.request.contextPath}/resources/assets/icons/restaurants-bars/restaurants/restaurant.png" alt=""></i>
                                                <span>Restaurant</span>
                                            </div>
                                            <div class="rating" data-rating="4"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.item-->
                            </div>
                            <!--/.col-sm-4-->
                            <div class=" col-sm-3">
                                <div class="item">
                                    <div class="image">
                                        <div class="quick-view"><i class="fa fa-eye"></i><span>Quick View</span></div>
                                        <a href="item-detail.html">
                                            
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/items/2.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="wrapper">
                                        <a href="item-detail.html"><h3>Benny’s Cafeteria</h3></a>
                                        <figure>63 Birch Street</figure>
                                        <div class="info">
                                            <div class="type">
                                                <i><img src="${pageContext.request.contextPath}/resources/assets/icons/restaurants-bars/restaurants/cafetaria.png" alt=""></i>
                                                <span>Cafeteria</span>
                                            </div>
                                            <div class="rating" data-rating="4"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.item-->
                            </div>
                            <!--/.col-sm-4-->
                            <div class=" col-sm-3">
                                <div class="item">
                                    <div class="image">
                                        <div class="quick-view"><i class="fa fa-eye"></i><span>Quick View</span></div>
                                        <a href="item-detail.html">
                                            
                                            <div class="item-specific">
                                                <span>Daily menu from: $6</span>
                                            </div>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/items/3.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="wrapper">
                                        <a href="item-detail.html"><h3>Big Bamboo</h3></a>
                                        <figure>4662 Bruce Street</figure>
                                        <div class="info">
                                            <div class="type">
                                                <i><img src="${pageContext.request.contextPath}/resources/assets/icons/restaurants-bars/restaurants/japanese-food.png" alt=""></i>
                                                <span>Sushi</span>
                                            </div>
                                            <div class="rating" data-rating="3"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.item-->
                            </div>
                            <!--/.col-sm-4-->
                            <div class=" col-sm-3">
                                <div class="item">
                                    <div class="image">
                                        <div class="quick-view"><i class="fa fa-eye"></i><span>Quick View</span></div>
                                        <a href="item-detail.html">
                                            
                                            <div class="item-specific">
                                                <span>Daily menu from: $6</span>
                                            </div>
                                            <img src="${pageContext.request.contextPath}/resources/assets/img/items/4.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="wrapper">
                                        <a href="item-detail.html"><h3>Sushi Wooshi Bar</h3></a>
                                        <figure>357 Trainer Avenue</figure>
                                        <div class="info">
                                            <div class="type">
                                                <i><img src="${pageContext.request.contextPath}/resources/assets/icons/restaurants-bars/restaurants/fishchips.png" alt=""></i>
                                                <span>Sushi Bar</span>
                                            </div>
                                            <div class="rating" data-rating="3"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.item-->
                            </div>
                            <!--/.col-sm-4-->
                        </div>
                        <!--/.row-->
                    </div>
                    <!--/.container-->
                    <div class="background opacity-5">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/restaurants-bg2.jpg" alt="">
                    </div>
                </section>
                <!--end Featured-->
                
                <section class="block background-color-white" id="testimonials">
                    <div class="container">
                        <div class="owl-carousel testimonials">
                            <blockquote>
                                <figure><img src="${pageContext.request.contextPath}/resources/assets/img/client.jpg" alt=""></figure>
                                <div class="description">
                                    <p>
                                        Fusce risus metus, placerat in consectetur eu, porttitor a est. Sed sed dolor lorem. Cras adipiscing
                                    </p>
                                    <footer>Natalie Jenkins</footer>
                                </div>
                            </blockquote>
                            <blockquote>
                                <figure><img src="${pageContext.request.contextPath}/resources/assets/img/client.jpg" alt=""></figure>
                                <div class="description">
                                    <p>
                                        Fusce risus metus, placerat in consectetur eu, porttitor a est. Sed sed dolor lorem. Cras adipiscing
                                    </p>
                                    <footer>Natalie Jenkins</footer>
                                </div>
                            </blockquote>
                        </div>
                    </div>
                </section>
                        <!--/.testimonials-->

                
                <section id="image">
                    <div class="container">
                        <div class="col-sm-8 col-sm-offset-2">
                            <div class="text-banner">
                                <figure>
                                    <img src="${pageContext.request.contextPath}/resources/assets/img/marker.png" alt="">
                                </figure>
                                <div class="description">
                                    <h2>Get the best value for money</h2>
                                    <p>
                                        Suspendisse potenti. Integer quis eleifend neque. Curabitur lobortis dictum mollis.
                                        In rhoncus sapien eget tellus sodales.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/.container-->
                    <div class="background">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/about-us-bg.jpg" alt="">
                    </div>
                    <!--/.bakcground-->
                </section>
<!-- End about 1 -->
            
            </div>
        </div>
