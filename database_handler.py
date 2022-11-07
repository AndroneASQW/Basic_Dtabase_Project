import pymysql

class DatabaseHandler:

    def __init__(self, username, password, db_name):
        """

        :param username:        username for the database connection
        :param password:        user's password for the database connection
        :param db_name:         the name of the database we connect to
        """

        self._username = username
        self._password = password
        self._db_name = db_name

    def _execute_DELETE(self, table_name, ID):
        """

        :param table_name:      The table we want to delete from
        :param ID:              ID of the row we want to remove

        :return:                True - if successful
                                False - otherwise
        """
        connection = pymysql.connect(
            host='localhost',
            user=self._username,
            password=self._password,
            db=self._db_name,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )

        try:
            if table_name == 'Musicians':
                sql_query = "DELETE FROM " + table_name + \
                            " WHERE id=%s"
            elif table_name == 'Songs':
                sql_query = "DELETE FROM " + table_name + \
                            " WHERE id_songs=%s"
            else:
                sql_query = "DELETE FROM " + table_name + \
                            " WHERE id_album=%s"

            print(sql_query)
            with connection.cursor() as cursor:
                cursor.execute(sql_query, ID)

            connection.commit()
            print("Done the deletion")

            connection.close()

            return True

        except:
            return False

        finally:
            connection.close()


    def _execute_UPDATE(self, table_name, set_part, values):
        """

        :param table_name:          Name of the table we execute the update on
        :param set_part:            The part of the query that follows the 'SET' keyword
        :param values:              The values to replace the wildcards

        :return:                    True - if successful
                                    False - otherwise
        """

        connection = pymysql.connect(
            host='localhost',
            user=self._username,
            password=self._password,
            db=self._db_name,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )

        print("set_part", values)

        try:

            if table_name == 'Musicians':
                sql_query = "UPDATE " + table_name + \
                        " SET" + set_part + \
                        " WHERE id=%s;"
            elif table_name == 'Songs':
                sql_query = "UPDATE " + table_name + \
                        " SET" + set_part + \
                        " WHERE id_songs=%s;"
            else:
                sql_query = "UPDATE " + table_name + \
                        " SET" + set_part + \
                        " WHERE id_album=%s;"
            print(sql_query)
            with connection.cursor() as cursor:
                cursor.execute(sql_query, values)

            connection.commit()
            connection.close()

            return True

        except:
            return False

        finally:
            connection.close()


    def get_albums(self):

        connection = pymysql.connect(
            host='localhost',
            user=self._username,
            password=self._password,
            db=self._db_name,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )

        try:

            sql_query = "SELECT * " \
                        "FROM Albums;"

            with connection.cursor() as cursor:
                global result
                cursor.execute(sql_query)
                result = cursor.fetchall()
                return result

        except:
            return None

        finally:
            connection.close()

    def get_musicians(self):

        connection = pymysql.connect(
            host='localhost',
            user=self._username,
            password=self._password,
            db=self._db_name,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )

        try:

            sql_query = "SELECT * " \
                        "FROM Musicians;"

            with connection.cursor() as cursor:
                cursor.execute(sql_query)
                result = cursor.fetchall()

                return result

        except:
            return None

        finally:
            connection.close()

    def get_songs(self):

        connection = pymysql.connect(
            host='localhost',
            user=self._username,
            password=self._password,
            db=self._db_name,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )

        try:

            sql_query = "SELECT s.id_songs, s.name, s.year, " \
                                "a.id_album, a.name, a.release_date, " \
                                "a.record_date, a.genre, a.producer, " \
                                "a.studio, a.length, m.id, m.birth_name, " \
                                "m.alias, m.year, m.genre, m.band, " \
                                "m.profile_url, m.instrument " \
                                \
                        "FROM Songs AS s " \
                            "INNER JOIN Musicians AS m " \
                                "ON s.musicians_id = m.id " \
                            "INNER JOIN Albums AS a " \
                                "ON s.albums_id_album = a.id_album;"

            with connection.cursor() as cursor:
                cursor.execute(sql_query)
                query_result = cursor.fetchall()

            print(query_result)

            final_result = list()

            for entry in query_result:
                new_entry = dict()

                new_entry['id'] = entry['id_songs']
                new_entry['name'] = entry['name']
                new_entry['year'] = entry['year']

                print("added song info")
                new_entry['album'] = dict()
                new_entry['album']['id'] = entry['id_album']
                new_entry['album']['name'] = entry['name']
                new_entry['album']['release_date'] = entry['release_date']
                new_entry['album']['record_date'] = entry['record_date']
                new_entry['album']['genre'] = entry['genre']
                new_entry['album']['producer'] = entry['producer']
                new_entry['album']['studio'] = entry['studio']
                new_entry['album']['length'] = entry['length']

                print("added album info")
                new_entry['musician'] = dict()
                new_entry['musician']['id'] = entry['id']
                new_entry['musician']['birth_name'] = entry['birth_name']
                new_entry['musician']['alias'] = entry['alias']
                new_entry['musician']['year'] = entry['m.year']
                new_entry['musician']['genre'] = entry['m.genre']
                new_entry['musician']['band'] = entry['band']
                new_entry['musician']['profile_url'] = entry['profile_url']
                new_entry['musician']['instrument'] = entry['instrument']

                print("added musician info")
                final_result.append(new_entry)


            return final_result

        except:
            return None

        finally:
            connection.close()

    def add_album(self, name, release_date, record_date,
                        genre, producer, length, studio):

        connection = pymysql.connect(
            host='localhost',
            user=self._username,
            password=self._password,
            db=self._db_name,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )

        try:

            sql_query = "INSERT INTO Albums " \
                            "(name, release_date, record_date, " \
                                "genre, producer, length, studio" \
                            ") " \
                        "VALUES (%s, %s, %s, %s, %s, %s, %s);"


            with connection.cursor() as cursor:
                cursor.execute(sql_query, (name, release_date, record_date, genre,
                                           producer, length, studio, ))

            connection.commit()

            connection.close()

            return True

        except:
            return False

        finally:
            connection.close()

    def add_musician(self, birth_name, alias, year, genre,
                           band, profile_url, instrument):

        connection = pymysql.connect(
            host='localhost',
            user=self._username,
            password=self._password,
            db=self._db_name,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )

        print("Inserting into DB..")

        try:

            sql_query = "INSERT INTO Musicians " \
                            "(birth_name, alias, " \
                                "year, genre, band, profile_url, instrument" \
                            ") " \
                        "VALUES (%s, %s, %s, %s, %s, %s, %s)    ;"


            with connection.cursor() as cursor:
                cursor.execute(sql_query, (birth_name, alias, year, genre, band,
                                           profile_url, instrument, ))

            connection.commit()
            connection.close()
            print("Done")
            return True

        except:
            return False

        finally:
            connection.close()

    def add_song(self, musician_id, album_id, name, year):

        print("Doing something")
        connection = pymysql.connect(
            host='localhost',
            user=self._username,
            password=self._password,
            db=self._db_name,
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )
        try:
            sql_query = "INSERT INTO Songs " \
                            "(musicians_id, albums_id_album, name, year) " \
                        "VALUES (%s, %s, %s, %s); "

            with connection.cursor() as cursor:
                cursor.execute(sql_query,
                               (musician_id, album_id, name, year, ))

            connection.commit()
            connection.close()

            return True

        except:
            return False

        finally:
            connection.close()

    def update_musicians_table(self, musician_ID, new_entries):
        """

        :param musician_ID:         ID of the musician we want to update
        :param new_entries:         new entries we want to get into the database

        :return:                    True - if successful
                                    False - otherwise
        """

        all_cols = ["birth_name", "alias", "year", "genre", "band", "profile_url", "instrument"]

        cols_for_update = [" " + str(x) + "=%s" for x in all_cols
                                if x in new_entries
                          ]

        set_part = ",".join(cols_for_update)

        l = list(new_entries.values())
        l.append(musician_ID)
        values = tuple(l)

        return self._execute_UPDATE("Musicians", set_part, values)

    def update_albums_table(self, album_ID, new_entries):
        """

        :param album_ID:            ID of the album we want to update
        :param new_entries:         New entries for the database

        :return:                    True - if successful
                                    False - otherwise
        """
        all_cols = ["name", "release_date", "record_date", "genre", "producer", "length", "studio"]

        cols_for_update = [" " + str(x) + "=%s" for x in all_cols
                           if x in new_entries
                           ]
        print(cols_for_update)

        set_part = ",".join(cols_for_update)

        l = list(new_entries.values())
        l.append(album_ID)
        values = tuple(l)

        return self._execute_UPDATE("Albums", set_part, values)

    def update_songs_table(self, song_ID, new_entries):

        """

        :param song_ID:             ID of the song we want to update
        :param new_entries:         New entries for the database

        :return:                    True - if successful
                                    False - otherwise
        """

        all_cols = ["musicians_id", "albums_id_album", "id_songs", "name", "year"]

        cols_for_update = [" " + str(x) + "=%s" for x in all_cols
                           if x in new_entries
                           ]

        set_part = ",".join(cols_for_update)

        l = list(new_entries.values())
        l.append(song_ID)
        values = tuple(l)

        return self._execute_UPDATE("Songs", set_part, values)

    def delete_from_songs(self, song_ID):
        """

        :param song_ID:         The ID of the song we want to delete

        :return:                True - if successful
                                False - otherwise
        """
        return self._execute_DELETE("Songs", song_ID)

    def delete_from_albums(self, album_ID):
        """

        :param album_ID:         The ID of the album we want to delete

        :return:                True - if successful
                                False - otherwise
        """
        return self._execute_DELETE("Albums", album_ID)

    def delete_from_musicians(self, musician_ID):
        """

        :param musician_ID:         The ID of the musician we want to delete

        :return:                True - if successful
                                False - otherwise
        """
        return self._execute_DELETE("Musicians", musician_ID)


