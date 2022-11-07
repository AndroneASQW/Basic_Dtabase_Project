<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- PAGE settings -->
  <link rel="icon" href="https://templates.pingendo.com/assets/Pingendo_favicon.ico">
  <title>Conference Neon - Pingendo template</title>
  <meta name="description" content="Free Bootstrap 4 Pingendo Neon template for unique events.">
  <meta name="keywords" content="Pingendo conference event neon free template bootstrap 4">
  <!-- CSS dependencies -->
  <link rel="stylesheet" href="css/theme.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <!-- Script: Make my navbar transparent when the document is scrolled to top -->
  <script src="js/navbar-ontop.js"></script>
  <!-- Script: Animated entrance -->
  <script src="js/animate-in.js"></script>
</head>

<body class="text-center">
  <!-- Navbar -->
  <div class="w-100 p-0">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <ul class="breadcrumb" style="margin-bottom:0px;margin-top:0px">
            <li class="breadcrumb-item">
              <a href="/">Home</a>
            </li>
            <li class="breadcrumb-item active">Add Songs</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- Cover -->
  <div class="d-flex align-items-center py-5 cover section-fade-in-out" style="background-image: url(&quot;assets/conference/cover.jpg&quot;);">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="display-1">Add Song</h1>
          <p class="lead">"Is there anyone we should know about?</p>
          <p class=""></p>
          <div class="form-group">
           <label>Musician</label>


                            {% if data["musicians"] %}
                                <select name="id">
                                    {% for musician in data['musicians'] %}
                                        <option value="{{musician['id']}}" name="{{musician['id']}}">
                                            {{ musician }}
                                        </option>
                                    {% endfor %}
                                </select>
                            {% else %}
                                <p class="error-message"> ERROR GETTING MUSICIANS DATA</p>
                            {% endif %}


                         Album:

                            {% if data["albums"] %}
                                <select name="id_album">
                                    {% for album in data['albums'] %}
                                        <option value="{{album['id_album']}}" name="{{album['id_album']}}">
                                            {{ album }}
                                        </option>
                                    {% endfor %}
                                </select>
                            {% else %}
                                <p class="error-message"> ERROR GETTING MUSICIANS DATA</p>
                            {% endif %}



              <div class="form-group"> <label>Song Name</label>
                <input class="form-control" placeholder="Type here" name="name"> </div>
              <div class="form-group"> <label>Year&nbsp;</label>
                <input class="form-control" placeholder="Type here" name="year"> </div>
              <div class="form-group"></div>
            </div>
          </div>
       <input type="submit" class="btn btn-lg btn-block w-50 px-5 animate-in-right mx-auto btn-outline-secondary" name="adaugaSongs" value="Add Song" >
        </div>
      </div>
<div class="row">
</div>
      <div class="row">
        <div class="col-12 mt-5">
        <a href="#" class="btn btn-lg btn-block w-50 px-5 animate-in-right mx-auto btn-outline-primary text-white" onclick="window.location.replace('/songs');">View Songs</a>
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
</body>

</html>