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
        <title>Songs</title>
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
        <%
            albumsDaoImpl albumsDaoImpl = new albumsDaoImpl();
            musiciansDaoImpl musiciansDaoImpl = new musiciansDaoImpl();
            List<Albums> listaAlbums = new ArrayList();
            listaAlbums = albumsDaoImpl.afiseazaAlbums();
            List<Musicians> listaMusicians = new ArrayList();
            listaMusicians = musiciansDaoImpl.afiseazaMusicians();
            request.setAttribute("listaAlbums", listaAlbums);
            request.setAttribute("listaMusicians", listaMusicians);
        %>
        <h1 align="center"> Tabela Songs:</h1> 
        <table border="1" align="center">
            <thead>
            <tr>
                <td><b>Idsong:</b></td>
                <td><b>Album Id:</b></td>
                 <td><b>Musician ID</b></td>
                <td><b>Song Name</b></td>

                <td><b>Year</b></td>

               
            </tr>
            </thead>

            <tbody>
            {% for item in data["main"] %}
                <tr>
                    <td>{{item["id"]}}</td>

                    <td>{{item["album"]["id"]}}</td>


                    
                    
                    
                    <td>{{item["musician"]["id"]}}</td>



                    
                    <td>{{item["name"]}}</td>
                    <td>{{item["year"]}}</td>
 
                </tr>
             {% endfor %}
            </tbody>
        </table>
        <form action="songs_controller" method="POST">
            <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('id_album').disabled = this.checked;
                        document.getElementById('id').disabled = this.checked;
                        document.getElementById('name').disabled = this.checked;
                        document.getElementById('year').disabled = this.checked;"><br><br>
                idSong:
                <select name="id" required>
                    {% for item in data["main"] %}

                        <option value="{{item['id']}}"> {{item["id"]}}</option>

                    {% endfor %}
                </select>
                <br><br>
                Id Album:
                <select name="id_album" required>
                    {% for item in data["all_albums"] %}
                        <option value="{{item['id_album']}}">
                            {{item["id_album"]}},
                            {{item["name"]}},
                            {{item["genre"]}},
                            {{item["length"]}},
                            {{item["studio"]}}
                        </option>
                    {% endfor %}
                </select>
                <br><br>
                idMusician
                <select name="id_musician" required>
                     {% for item in data["all_musicians"] %}
                        <option value="{{item['id']}}">
                            {{item["id"]}},
                            {{item["birth_name"]}},
                            {{item["alias"]}},
                            {{item["band"]}},
                            {{item["instrument"]}},
                        </option>
                     {% endfor %}
                </select>
                <br><br>
                Modifica Numele: <input id="name" type="text" name="name"><br><br>
                Modifica Anul: <input id="year" type="text" name="year"> <br><br>
               
                <button type="submit" id="submitButton"> </button>

            </p>
        </form>
        <br>
        <p align="center">
            <a href="/"><b>Home</b></a>
        </p>
    </body>
</html>
