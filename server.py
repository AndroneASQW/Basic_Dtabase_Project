from flask import Flask, render_template, request, redirect, flash
from flask_session import Session
from database_handler import DatabaseHandler as DH
from dateutil import parser

app = Flask(__name__)
sess = Session()
dh = DH('root', 'root', 'musicians')


def _delete_update_handler(data, delete_function, update_function, redirect_page, date_keys=[], int_keys=[]):
    """

    :param data:                The data from the form
    :param delete_function:     The function executed when we want to delete
    :param update_function:     The function executed when we want to update
    :param redirect_page:       The page we redirect to after the action is performed
    :param date_keys:           List of keys where the entries are a date
    :param int_keys:            List of keys where the entries are an integer
    :return:
    """

    print('delete' in data)
    try:
        if 'update' in data:
            new_entries = dict()
            musician_ID = int(data.get('id'))

            for key in data:
                if key == 'update' or key == 'id' or data[key] == '':
                    continue

                if key in date_keys:
                    new_entries[key] = parser.parse(data[key])
                    continue

                if key in int_keys:
                    new_entries[key] = int(data[key])
                    continue

                new_entries[key] = data[key]
            print(new_entries)
            success = update_function(musician_ID, new_entries)

            if success:
                flash('Update completed successfully')
            else:
                flash('Something went wrong while doing the update')

        else:
            success = delete_function(int(data.get('id')))

            if success:
                flash('Deletion completed successfully')
            else:
                flash('Deletion completed successfully')
    except:
        flash('Something went wrong')

    finally:
        return redirect(redirect_page)


@app.route("/", methods=["GET"])
def home():
    return render_template("index.html")


@app.route("/add_musicians", methods=["GET"])
def add_musicians():
    return render_template("adauga_Musicians.jsp")


@app.route("/add_albums", methods=["GET"])
def add_albums():
    return render_template("adauga_Albums.jsp")


@app.route("/add_songs", methods=["GET"])
def add_songs():
    data = dict()
    data["musicians"] = dh.get_musicians()
    data["albums"] = dh.get_albums()
    print(data)
    return render_template("adauga_Songs.jsp", data=data)


@app.route("/musicians", methods=["GET"])
def musicians():
    data = dh.get_musicians()
    return render_template("tabela_Musicians.jsp", musicians=data)


@app.route("/albums", methods=["GET"])
def albums():
    data = dh.get_albums()
    return render_template("tabela_Albums.jsp", albums=data)


@app.route("/songs", methods=["GET"])
def songs():
    data = dict()
    data["main"] = dh.get_songs()
    data["all_musicians"] = dh.get_musicians()
    data["all_albums"] = dh.get_albums()
    return render_template("tabela_Songs.jsp", data=data)


@app.route("/musician_adder", methods=["POST"])
def insert_musician():

    try:
        print("worked", request.form)
        success = dh.add_musician(
            request.form["birth_name"],
            request.form["alias"],
            parser.parse(request.form["year"]),
            request.form["genre"],
            request.form["band"],
            request.form["profile_url"],
            request.form["instrument"]
        )
        print(success)

        if success:
            flash('New musician inserted into the database')
        else:
            flash('New musician inserted into the database')

    except:
        flash('New musician inserted into the database')

    finally:
        return redirect('/add_musicians')


@app.route("/album_adder", methods=["POST"])
def insert_album():
    try:
        success = dh.add_album(
            request.form["name"],
            parser.parse(request.form["release_date"]),
            parser.parse(request.form["record_date"]),
            request.form["genre"],
            request.form["producer"],
            int(request.form["length"]),
            request.form["studio"]
        )
        if success:
            flash('New album inserted to the database')
        else:
            flash('New album inserted to the database')

    except:
        flash('New album inserted to the database')
    finally:
        return redirect('/add_albums')


@app.route("/song_adder", methods=["POST"])

def insert_song():
    print("am ajuns macar aici")
    try:
        print(request.form)
        success = dh.add_song(
            int(request.form["id"]),
            int(request.form["id_album"]),
            request.form["name"],
            int(request.form["year"])
        )
        print(success)
        if success:
            flash('New song added to the database')
        else:
            flash('New song added to the database')
    except:
        flash('New song added to the database')
    finally:
        return redirect('/add_songs')


@app.route("/musicians_controller", methods=["POST"])
def musician_controller():

    data = request.form

    return _delete_update_handler(data,
                                  delete_function=dh.delete_from_musicians,
                                  update_function=dh.update_musicians_table,
                                  redirect_page='/musicians',
                                  date_keys=['year'])


@app.route("/songs_controller", methods=["POST"])
def song_controller():
    data = request.form

    return _delete_update_handler(data,
                                  delete_function=dh.delete_from_songs,
                                  update_function=dh.update_songs_table,
                                  redirect_page='/songs',
                                  int_keys=['year'])


@app.route("/albums_controller", methods=["POST"])
def albums_controller():
    data = request.form

    return _delete_update_handler(data,
                                  delete_function=dh.delete_from_albums,
                                  update_function=dh.update_albums_table,
                                  redirect_page='/albums',
                                  date_keys=['release_date', 'record_date'],
                                  int_keys=['length'])

if __name__ == "__main__":
    app.secret_key = 'super secret key'
    app.config['SESSION_TYPE'] = 'filesystem'

    sess.init_app(app)

    app.run(
        debug=True
    )




