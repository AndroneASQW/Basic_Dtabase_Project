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
  <title>Musicians Table</title>

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
              <a href="#">Add Musicians</a>
            </li>
            <li class="breadcrumb-item active">Musicians Table</li>
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
          <h1 class="display-1">Musicians Table</h1>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5 section-fade-in" id="schedule" style="background-image: url(&quot;/static/assets/conference/live.jpg&quot;);">
    <div class="container my-5">
      <div class="row">
        <div class="col-12">
          <div class="col-md-12 p-3">
            <table class="table table-hover table-striped table-bordered">
              <thead class="thead-inverse">
                <tr>
                  <th scope="col"># ID</th>
                  <th scope="col">Birth Name</th>
                  <th scope="col" class="">Alias</th>
                  <th>Birth Date</th>
                  <th>Genre</th>
                  <th>Band</th>
                  <th>URL Profile</th>
                  <th>Instrument</th>
                </tr>
              </thead>
              <tbody>
               {% for item in musicians %}
                <tr>
                  <th scope="row">{{item["id"]}}</th>
                  <td class="text-white">{{item["birth_name"]}}</td>
                  <td>{{item["alias"]}}</td>
                  <td>{{item["year"]}}</td>
                  <td>{{item["genre"]}}</td>
                  <td>{{item["band"]}}</td>
                  <td>{{item["profile_url"]}}</td>
                  <td>{{item["instrument"]}}</td>
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

    <form action="musicians_controller" method="POST">

      <div class="row">
        <div class="col-md-12">
          <div class="btn-group m-2">
            <select class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false" name="id" required>
             {% for item in musicians %}
                        <option value="{{item['id']}}">{{item["id"]}}</option>
                    {% endfor %}
                    </select>

            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="form-group">
            <input id="birth_name" type="text" class="form-control form-control-lg" placeholder="Birth Name"  name="birth_name"> </div>
          <div class="form-group">
            <input id="alias" type="text" class="form-control form-control-lg" placeholder="Alias" name="alias"> </div>
          <div class="form-group">
            <input id="year" type="text" class="form-control form-control-lg" placeholder="Birth Date" name="year"> </div>
          <div class="form-group">
            <input id="genre" type="text" class="form-control form-control-lg" placeholder="Genre" name="genre"> </div>
          <div class="form-group">
            <input id="band" type="text" class="form-control form-control-lg" placeholder="Band" name="band"> </div>
          <div class="form-group">
            <input id="profile_url" type="text" class="form-control form-control-lg" placeholder="Profile URL" name="profile_url"> </div>
          <div class="form-group">
            <input id="intrument" type="text" class="form-control form-control-lg" placeholder="Instrument" name="instrument">
            <div class="row">
            <div class="col-md-6">
                <div class="col-md-12">
                  <div class="form-check form-check-inline"> <label class="form-check-label">
                Sterge: <input class="form-check-input" type="radio" value="Delete Musician" id="delete"   onclick="document.getElementById('nume').disabled = this.checked;
                        document.getElementById('birth_name').disabled = this.checked;
                        document.getElementById('alias').disabled = this.checked;"><br><br>>
              </label> </div>
                </div>
              </div>
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('nume').disabled = this.checked;
                        document.getElementById('birth_name').disabled = this.checked;
                        document.getElementById('alias').disabled = this.checked;"><br><br>
              <div class="col-md-6">
                <div class="col-md-10">
                  <div class="form-check form-check-inline"> <label class="form-check-label">
               Modifica: <input class="form-check-input" type="radio" value="Modify Musician" id="update" >
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
      </form>
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