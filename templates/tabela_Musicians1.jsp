{% with messages = get_flashed_messages() %}
  {% if messages %}
    <script>
      var messages = {{ messages | safe }};
      for (var i=0; i<messages.length; i++) {
        alert(messages[i]);
      }
    </script>
  {% endif %}
{% endwith %}

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Musicians</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    </head>
    <body>
        <h1 align="center"> Tabela Musicians:</h1> 
        <table border="1" align="center">
            <thead>
            <tr>
                <td><b>IdPacient:</b></td>
                <td><b>Nume</b></td>
                <td><b>Alias:</b></td>
                <td><b>An:</b></td>

                <td><b>Gen:</b></td>
                <td><b>Banda:</b></td>
                <td><b>URL Profil:</b></td>
                <td><b>Instrument:</b></td>

            </tr>
            </thead>
            <tbody>
            {% for item in musicians %}
                <tr>
                    <td>{{item["id"]}}</td>
                    <td>{{item["birth_name"]}}</td>
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
        <form action="musicians_controller" method="POST">
            <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('nume').disabled = this.checked;
                        document.getElementById('birth_name').disabled = this.checked;
                        document.getElementById('alias').disabled = this.checked;"><br><br>
                <select name="id" required>
                    {% for item in musicians %}
                        <option value="{{item['id']}}">{{item["id"]}}</option>
                    {% endfor %}
                    <option value="test"> Test </option>
                </select>
                <br><br>
                    Modifica Nume Nastere: <input id="birth_name" type="text" name="birth_name"><br><br>
                    Modifica Alias: <input id="alias" type="text" name="alias"> <br><br>
                    Modifica Year <input id="year" type="text" name="year"> <br><br>
                    Modifica Genre: <input id="genre" type="text" name="genre"><br><br>
                    Modifica Band <input id="band" type="text" name="band"> <br><br>
                    Modifica Profile url <input id="profile_url" type="text" name="profile_url"> <br><br>
                    Modifica Instrument <input id="intrument" type="text" name="instrument"> <br><br>
                <button type="submit" id="submitButton"> </button>
            </p>
        </form>
        <p align="center">
            <a href="/"><b>Home</b></a>
        </p>
    </body>
</html>

