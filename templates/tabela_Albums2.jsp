<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- PAGE settings -->
  <link rel="icon" href="https://templates.pingendo.com/assets/Pingendo_favicon.ico">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
  <title>Albums Table</title>

      <script>
            $(document).ready(function () {
                $("#submitButton").hide();
                function toggleSubmitButton() {
                    if (document.getElementById("update").checked && !document.getElementById("delete").checked) {
                        $("#submitButton").show();
                        document.getElementById("submitButton").name="update";
                        document.getElementById("submitButton").innerHTML = "Modifica";
                    } else if (!document.getElementById("update").checked && document.getElementById("delete").checked) {
                        $("#submitButton").show();
                        document.getElementById("submitButton").name="delete";
                        document.getElementById("submitButton").innerHTML = "Sterge";
                    } else {
                        $("#submitButton").hide();
                    }
                }

                {% with messages = get_flashed_messages() %}
                    {% if messages %}
                        var messages = {{ messages | safe }};
                        for (var i=0; i<messages.length; i++) {
                            alert(messages[i]);
                        }
                    {% endif %}
                {% endwith %}

                $("#update").click(toggleSubmitButton);
                $("#delete").click(toggleSubmitButton);
            });
        </script>
  <meta name="description" content="Free Bootstrap 4 Pingendo Neon template for unique events.">
  <meta name="keywords" content="Pingendo conference event neon free template bootstrap 4">
  <!-- CSS dependencies -->
  <link rel="stylesheet" href="static/css/theme.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <!-- Script: Make my navbar transparent when the document is scrolled to top -->
  <script src="static/js/navbar-ontop.js"></script>
  <!-- Script: Animated entrance -->
  <script src="static/js/animate-in.js"></script>
</head>

<body class="text-center">
  <!-- Navbar -->
  <div class="py-2">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <ul class="breadcrumb" style="margin-bottom: 0px; margin-top: 0px;">
            <li class="breadcrumb-item">
              <a href="/">Home</a>
            </li>
            <li class="breadcrumb-item">
              <a href="/add_albums">Add Albums</a>
            </li>
            <li class="breadcrumb-item active">Albums Table</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- Cover -->
  <!-- Intro section -->
  <!-- Speakers -->
  <!-- Schedule -->
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="display-1">Albums Table</h1>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5 section-fade-in" id="schedule" style="background-image: url(&quot;/static/assets/conference/venue.jpg&quot;);">
    <div class="container my-5">
      <div class="row">
        <div class="col-12">
          <div class="col-md-12 p-3">
            <table class="table table-hover table-striped table-bordered">
              <thead class="thead-inverse">
                <tr>
                  <th scope="col"># ID Album</th>
                  <th scope="col">Album Name</th>
                  <th scope="col" class="">Release Date</th>
                  <th>Record Date</th>
                  <th>Genre</th>
                  <th>Producer</th>
                  <th>Length (minutes)</th>
                  <th>Band</th>
                </tr>
              </thead>
              <tbody>
               {% for item in albums %}
                <tr>
                  <th scope="row">{{item["id_album"]}}</th>
                  <td class="text-white">{{item["name"]}}</td>
                  <td>{{item["release_date"]}}</td>
                  <td>{{item["record_date"]}}</td>
                  <td>{{item["genre"]}}</td>
                  <td>{{item["producer"]}}</td>
                  <td>{{item["length"]}}</td>
                  <td>{{item["studio"]}}</td>
                </tr>
                 {% endfor %}

              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="row text-left"></div>
    </div>
  </div>
  <div class="py-5 section-fade-in" style="background-image: url('/static/assets/conference/people_5.jpg');">
    <div class="container">

    <form action="albums_controller" method="POST">

      <div class="row">
        <div class="col-md-12">
          <div class="btn-group m-2">
            <select class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false" name="id" required>
              {% for item in albums %}
                        <option value="{{item['id_album']}}">{{item["id_album"]}}</option>
                    {% endfor %}
                    </select>
            <div class="dropdown-menu" x-placement="top-start" style="position: absolute; transform: translate3d(0px, -252px, 0px); top: 0px; left: 0px; will-change: transform;">
              <h6 class="dropdown-header">Dropdown header</h6>
              <a class="dropdown-item" href="#">Option 1</a>
              <a class="dropdown-item" href="#">Option 2</a>
              <a class="dropdown-item disabled" href="#">Disabled option</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Separated link</a>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="form-group">
            <input id="name" type="text" class="form-control form-control-lg" placeholder="Album Name"  name="name"> </div>
          <div class="form-group">
            <input id="release_date" type="text" class="form-control form-control-lg" placeholder="Release Date" name="release_date"> </div>
          <div class="form-group">
            <input id="record_date" type="text" class="form-control form-control-lg" placeholder="Record Date" name="record_date"> </div>
          <div class="form-group">
            <input id="genre" type="text" class="form-control form-control-lg" placeholder="Genre" name="genre"> </div>
          <div class="form-group">
            <input id="producer" type="text" class="form-control form-control-lg" placeholder="Band" name="producer"> </div>
          <div class="form-group">
            <input id="length" type="text" class="form-control form-control-lg" placeholder="Length (minutes)" name="length"> </div>
          <div class="form-group">
            <input id="studio" type="text" class="form-control form-control-lg" placeholder="Band" name="studio">
            <div class="row">
              <div class="col-md-6">
                <div class="col-md-10">
                  <div class="form-check form-check-inline"> <label class="form-check-label">
                <input class="form-check-input" type="radio" value="Modify Album" id="update" > Modify Album
              </label> </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="col-md-12">
                  <div class="form-check form-check-inline"> <label class="form-check-label">
                <input class="form-check-input" type="radio" value="Delete Album" id="delete" > Delete Album
              </label> </div>
                </div>
              </div>

            </div>
            <button type="submit" class="btn btn-primary my-2 animate-in-right carousel" id="submitButton">Submit button</button>
          </div>
        </div>
      </div>
      <div class="row"></div>
      <div class="row">
        <div class="col-md-12"></div>
      </div>
      <div class="row">
        <div class="col-md-12"></div>
      </div>
      <div class="row"></div>
      <div class="row"></div>
    </div>
  </div>
  <!-- Sponsor logos -->
  <!-- Call to action -->
  <!-- Footer -->
  <!-- JavaScript dependencies -->
  <script src="http://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <!-- Script: Smooth scrolling between anchors in a same page -->
  <script src="static/js/smooth-scroll.js"></script>
  <pingendo onclick="window.open('https://pingendo.com/', '_blank')" style="cursor:pointer;position: fixed;bottom: 10px;right:10px;padding:4px;background-color: #00b0eb;border-radius: 8px; width:180px;display:flex;flex-direction:row;align-items:center;justify-content:center;font-size:14px;color:white">Made with Pingendo&nbsp;&nbsp;
    <img src="https://pingendo.com/site-assets/Pingendo_logo_big.png" class="d-block" alt="Pingendo logo" height="16">
  </pingendo>
</body>

</html>