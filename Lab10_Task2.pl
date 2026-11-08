user_db(admin, 'pass123').
user_db(john, 'secret').
user_db(alice, 'p@ssword').

login :-
    check_credentials(3).

check_credentials(0) :-
    writeln('Sorry, you exceeded the maximum number of attempts, try again later.'), !.

check_credentials(Attempts) :-
    Attempts > 0,
    write('Enter Username: '),
    read(User),
    write('Enter Password: '),
    read(Pass),
    (   user_db(User, Pass)
    ->  writeln('Login Successful')
    ;   writeln('Login Unsuccessful'),
        Remaining is Attempts - 1,
        check_credentials(Remaining)
    ).
