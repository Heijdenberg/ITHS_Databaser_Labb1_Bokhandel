
create procedure FlyttaBok
    @ISBN char(13),
    @FrånButikId int,
    @TillButikId int,
    @AntalSomSkaFlyttas int = 1
as
begin
    set nocount on;

    begin try
        IF (@AntalSomSkaFlyttas <= 0)
        BEGIN
            ;THROW 50003, 'Antalet som ska flyttas måste vara större än 0.', 1;
            RETURN;
        END

        begin tran;
            declare @AntalSomKanFlyttas int;

            select
                @AntalSomKanFlyttas = antal
            from
                LagerSaldo
            where
                ISBN = @ISBN and ButiksId = @FrånButikId

            if @AntalSomKanFlyttas >= @AntalSomSkaFlyttas and @AntalSomKanFlyttas is not null
            begin
                update
                    LagerSaldo
                set
                    antal = antal-@AntalSomSkaFlyttas
                where
                    ISBN = @ISBN and ButiksId = @FrånButikId

                if exists (
                    select 1 
                    from LagerSaldo 
                    where ISBN = @ISBN and ButiksId = @TillButikId
                )
                begin
                    update LagerSaldo
                    set Antal = Antal + @AntalSomSkaFlyttas
                    where ISBN = @ISBN and ButiksId = @TillButikId;
                end
                else
                begin
                    insert into LagerSaldo (ISBN, ButiksId, Antal)
                    values (@ISBN, @TillButikId, @AntalSomSkaFlyttas);
                end
            end
            else
            begin
                ;throw 50002, 'Lagersaldot är otillräckligt eller produkten hittades inte.', 1;
                return;
            end
        commit tran;
    end try
    begin catch
        if @@TRANCOUNT > 0
            rollback tran;
        ;throw;
    end catch
end;
go