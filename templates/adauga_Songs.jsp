<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Songs</title>

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
    {% if data %}
        <div id="add">
            <h1> Adauga un nou song </h1>
            <form action="song_adder" method="POST">
                <table>
                    <tr>
                        <td> Musician </td>
                        <td>
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
                        </td>
                    </tr>
                    <tr>
                        <td> Album: </td>
                        <td>
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
                        </td>
                    </tr>
                    <tr>
                        <td> Song </td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td> Year </td>
                        <td><input type="text" name="year"></td>
                    </tr>
                   
                    <tr>
                        <td><input type="submit" name="adaugaSongs" value="Adauga"></td>

                    </tr>
                </table>
            </form>
        </div>

        <button type="button" onclick="window.location.replace('/songs');">
            Afiseaza
        </button><br>
        <br>
        <a href="/"><b>Home</b></a>
    {% endif %}
    </body>
</html>
