<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Albums</title>

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
    </head>
    <body>

        <div id="add">
            <h1> Adauga Albums </h1>
            <form action="album_adder" method="POST">
                <table>
                    <tr>
                        <td> name </td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td> release_date: </td>
                        <td><input type="text" name="release_date"></td>
                    </tr>
                    <tr>
                        <td> release_date: </td>
                        <td><input type="text" name="record_date"></td>
                    </tr>
                    <tr>
                        <td> Genre </td>
                        <td><input type="text" name="genre"></td>
                    </tr>
                    
                     <tr>
                        <td> Producer </td>
                        <td><input type="text" name="producer"></td>
                    </tr>
                    
                     <tr>
                        <td> Album length (minutes): </td>
                        <td><input type="text" name="length"></td>
                    </tr>
                    
                    <tr>
                        <td> Studio: </td>
                        <td><input type="text" name="studio"></td>
                    </tr>
                    
                    <tr>
                        <td><input type="submit" name="adaugaAlbum" value="Adauga"></td>

                    </tr>
                </table>
            </form>
        </div>

         <button type="button" onclick="window.location.replace('/albums');">
            Afiseaza
        </button>

        <br>
        <br>

        <a href="/"><b>Home</b></a>
    </body>
</html>
