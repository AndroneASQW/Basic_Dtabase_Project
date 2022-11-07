<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- PAGE settings -->
  <link rel="icon" href="https://templates.pingendo.com/assets/Pingendo_favicon.ico">
  <title>Musicians Table</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
  <link rel="stylesheet" href="/static/css/theme.css">
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
              <a href="/add_musicians">Add Musicians</a>
            </li>
            <li class="breadcrumb-item active">Link</li>
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
  <div class="py-5 section-fade-in" id="schedule" style="background-image: url(&quot;static/assets/conference/live.jpg&quot;);">
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
                  <td>{{item["instrument"]}}/td>
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
  <div class="py-5 section-fade-in" style="background-image: url('static/assets/conference/people_5.jpg');">
    <div class="container">
    <form action="musicians_controller" method="POST">
      <div class="row">
        <div class="col-md-12">
          <div class="btn-group m-2">
            <input class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false" name="id" required>ID
            % for item in musicians %}
                        <option value="{{item['id']}}">{{item["id"]}}</option>
                    {% endfor %}



          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="form-group">
            <input id="birth_name" name="birth_name" type="text" class="form-control form-control-lg" placeholder="Birth Name"> </div>
          <div class="form-group">
            <input id="alias" name="alias" type="text" class="form-control form-control-lg" placeholder="Alias"> </div>
          <div class="form-group">
            <input id="year" name="year" type="text" class="form-control form-control-lg" placeholder="Birth Date"> </div>
          <div class="form-group">
            <input id="genre" name="genre" type="text" class="form-control form-control-lg" placeholder="Genre"> </div>
          <div class="form-group">
            <input id="band" name="band" type="text" class="form-control form-control-lg" placeholder="Band"> </div>
          <div class="form-group">
            <input id="profile_url" name="profile_url" type="text" class="form-control form-control-lg" placeholder="Profile URL"> </div>
          <div class="form-group">
            <input id="intrument" name="intrument" type="text" class="form-control form-control-lg" placeholder="Instrument">
            <div class="row">
              <div class="col-md-6">
                <div class="col-md-10">
                  <div class="form-check form-check-inline"> <label class="form-check-label">
                <input class="form-check-input" type="radio" value="option1" id="update" name="inlineRadioOptions"> Modify Musician
              </label> </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="col-md-12">
                  <div class="form-check form-check-inline"> <label class="form-check-label">
                <input class="form-check-input" type="radio" value="option2" id="delete" name="inlineRadioOptions" onclick="document.getElementById('nume').disabled = this.checked;
                        document.getElementById('birth_name').disabled = this.checked;
                        document.getElementById('alias').disabled = this.checked;"><br><br>> Delete Musician
              </label> </div>
                </div>
              </div>
            </div>
            <button id="submitButton" type="submit" class="btn btn-primary my-2 animate-in-right carousel" >Submit button</button>
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
  <script src="/static/js/smooth-scroll.js"></script>
  <pingendo onclick="window.open('https://pingendo.com/', '_blank')" style="cursor:pointer;position: fixed;bottom: 10px;right:10px;padding:4px;background-color: #00b0eb;border-radius: 8px; width:180px;display:flex;flex-direction:row;align-items:center;justify-content:center;font-size:14px;color:white">Made with Pingendo&nbsp;&nbsp;
    <img src="https://pingendo.com/site-assets/Pingendo_logo_big.png" class="d-block" alt="Pingendo logo" height="16">
  </pingendo>
</body>

</html>