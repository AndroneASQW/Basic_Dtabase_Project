<!DOCTYPE html>
<html>

<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready( function() {
                {% with messages = get_flashed_messages() %}
                    {% if messages %}
                        var messages = {{ messages | safe }};
                        for (var i=0; i<messages.length; i++) {
                            alert(messages[i]);
                        }
                    {% endif %}
                {% endwith %}
            });
        </script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- PAGE settings -->
  <link rel="icon" href="https://templates.pingendo.com/assets/Pingendo_favicon.ico">
  <title>Add Musicians</title>
  <meta name="description" content="Free Bootstrap 4 Pingendo Neon template for unique events.">
  <meta name="keywords" content="Pingendo conference event neon free template bootstrap 4">
  <!-- CSS dependencies -->
  <link rel="stylesheet" href="/static/css/theme.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <!-- Script: Make my navbar transparent when the document is scrolled to top -->
  <script src="static/js/navbar-ontop.js"></script>
  <!-- Script: Animated entrance -->
  <script src="static/js/animate-in.js"></script>
</head>

<body class="text-center">
  <!-- Navbar -->
  <div id = "add">
  <div class="w-100 p-0">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <ul class="breadcrumb" style="margin-bottom:0px;margin-top:0px">
            <li class="breadcrumb-item">
              <a href="/">Home</a>
            </li>
            <li class="breadcrumb-item active">Add Musicians</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- Cover -->
  <div class="d-flex align-items-center py-5 cover section-fade-in-out" style="background-image: url(&quot;static/assets/conference/cover.jpg&quot;);">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="display-1">Add Musicians</h1>
          <p class="lead">"Is there anyone we should know about?</p>
          <p class=""></p>
            <form action="musician_adder" method="POST">
          <div class="form-group"> <label>Birth Name</label>
            <input class="form-control" placeholder="Type here" type="text" name="birth_name">
            <div class="form-group"> <label>Alias</label>
              <input class="form-control" placeholder="Type here" type="text" name="alias">
              <div class="form-group"> <label>Birth Date</label>
                <input class="form-control" placeholder="Type here" name="year"> </div>
              <div class="form-group"> <label>Genre</label>
                <input class="form-control" placeholder="Type here" name="genre"> </div>
              <div class="form-group"> <label>Band</label>
                <input class="form-control" placeholder="Type here" name="band"> </div>
            </div>
          </div>
          <div class="form-group"> <label>Profile Url</label>
            <input class="form-control" placeholder="Type here" name="profile_url"> </div>
          <div class="form-group"> <label>Instrument</label>
            <input class="form-control" placeholder="Type here" name="instrument"> </div>
          <h1 class="display-1"></h1>
       <input type="submit" class="btn btn-lg btn-block w-50 px-5 animate-in-right mx-auto btn-outline-secondary" name="adaugaMusicians" value="Add Musician" >


        </div>
      </div>
      <div class="row">
        <div class="col-12 mt-5">
          <a href="#" class="btn btn-lg btn-block w-50 px-5 animate-in-right mx-auto btn-outline-primary text-white" onclick="window.location.replace('/musicians');">View Musicians</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Intro section -->
  <!-- Speakers -->
  <!-- Schedule -->
  <!-- Sponsor logos -->
  <!-- Call to action -->
  <!-- Footer -->
  <!-- JavaScript dependencies -->
  <script src="http://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <!-- Script: Smooth scrolling between anchors in a same page -->
  <script src="js/smooth-scroll.js"></script>
  <pingendo onclick="window.open('https://pingendo.com/', '_blank')" style="cursor:pointer;position: fixed;bottom: 10px;right:10px;padding:4px;background-color: #00b0eb;border-radius: 8px; width:180px;display:flex;flex-direction:row;align-items:center;justify-content:center;font-size:14px;color:white">Made with Pingendo&nbsp;&nbsp;
    <img src="https://pingendo.com/site-assets/Pingendo_logo_big.png" class="d-block" alt="Pingendo logo" height="16">
  </pingendo>
  </div>
</body>

</html>