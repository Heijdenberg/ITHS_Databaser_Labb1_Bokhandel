-- denna kan man använda för att kunna få ut toplistor för föregående månad.
-- select top (5) * from [vw_BockerForraManadenAgg] order by [TotaltAntalSåld] desc;

-- eller om man bara vill kolla hur en bok solde förra mmånaden.


create view [vw_BockerForraManadenAgg] as
select
    fd.[ISBN],
    b.[Titel],
    sum(fd.[Antal]) as [TotaltAntalSåld]
from [FörsäljningsDetaljer] fd
join [Böcker] b 
    on fd.[ISBN] = b.[ISBN]
join [Försäljningar] f 
    on fd.[FörsäljningsId] = f.[Id]
where f.[OrderDatum] >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - 1, 0)
  and f.[OrderDatum] <  DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)
group by
    fd.[ISBN],
    b.[Titel];