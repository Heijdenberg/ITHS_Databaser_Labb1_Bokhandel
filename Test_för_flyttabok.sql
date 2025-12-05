


EXEC FlyttaBok
    @ISBN = '9789100123456',
    @FrånButikId = 1,
    @TillButikId = 2,
    @AntalSomSkaFlyttas = 2;

EXEC FlyttaBok
    @ISBN = '9789100123456',
    @FrånButikId = 2,
    @TillButikId = 1;

select * from LagerSaldo where ISBN = '9789100123456'