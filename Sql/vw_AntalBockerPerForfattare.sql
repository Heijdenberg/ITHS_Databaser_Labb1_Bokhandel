
create view vw_AntalBockerPerForfattare as
select
    f.Id,
    f.Förnamn,
    f.Efternamn,
    count(bf.ISBN) as AntalBöcker
from Författare f
left join Bokförfattare bf on bf.FörfattarId = f.Id
group by f.Id, f.Förnamn, f.Efternamn;

