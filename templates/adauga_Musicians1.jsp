<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Musicians</title>

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
            <h1> Add musicians </h1>
            <form action="musician_adder" method="POST">
                <table>
                    <tr>
                        <td> Birth name  Musician: </td>
                        <td><input type="text" name="birth_name"></td>
                    </tr>
                    
                        <tr>
                        <td> Alias </td>
                        <td><input type="text" name="alias"></td>
                    </tr>
                    <tr>
                    
                    <tr>
                        <td> Birth date </td>
                        <td><input type="text" name="year"></td>
                    </tr>
                    <tr>
                        <td> Genre: </td>
                        <td><input type="text" name="genre"></td>
                    </tr>
                    
                     <tr>
                        <td> Profile Url </td>
                        <td><input type="text" name="band"></td>
                    </tr>
                    
                     <tr>
                        <td> Genre: </td>
                        <td><input type="text" name="profile_url"></td>
                    </tr>
                    
                     <tr>
                        <td> Instrument: </td>
                        <td><input type="text" name="instrument"></td>
                    </tr>
                    
                    <tr>
                        <td><input type="submit" name="adaugaMusicians" value="Adauga"></td>

                    </tr>
                </table>
            </form>
        </div>

        <button type="button" onclick="window.location.replace('/musicians');">
            Afiseaza
        </button>

        <br>
        <br>
        <a href="/"><b>Home</b></a>
    </body>
</html>
