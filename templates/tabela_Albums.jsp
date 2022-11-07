<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medici</title>
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
        <h1 align="center"> Tabela Albums</h1> 
        <table border="1" align="center">
            <thead>
            <tr>
                <td><b>Id Album</b></td>
                <td><b>Name</b></td>
                <td><b>Release date:</b></td>
                <td><b>Record date</b></td>
                
                <td><b>Genre</b></td>
                <td><b>Producer</b></td>
                <td><b>Length </b></td>
                <td><b>Studio</b></td>
            </tr>
            </thead>
            <tbody>
            {% for item in albums %}
                <tr>
                    <td>{{item["id_album"]}}</td>
                    <td>{{item["name"]}}</td>
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
        <form action="albums_controller" method="POST">
            <p align="center">
                Modifica: <input type="checkbox"  id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('nume').disabled = this.checked;
                        document.getElementById('prenume').disabled = this.checked;
                        document.getElementById('adresa').disabled = this.checked;"><br><br>
                <select name="id" required>
                    {% for item in albums %}
                        <option value="{{item['id_album']}}">{{item["id_album"]}}</option>
                    {% endfor %}
                </select>
                <br><br>
                Modifica Name: <input id="name" type="text" name="name"><br><br>
                Modifica Release_Date <input id="release_date" type="text" name="release_date"> <br><br>
                Modifica Record Date: <input id="record_date" type="text" name="record_date"> <br><br>
                Modifica Genre: <input id="genre" type="text" name="genre"><br><br>
                Modifica Producer <input id="producer" type="text" name="producer"> <br><br>
                Modifica Length : <input id="length" type="text" name="length"> <br><br>

                <button type="submit" id="submitButton"> </button>

            </p>
        </form>
        <p align="center">
            <a href="/"><b>Home</b></a>
        </p>
    </body>
</html>
